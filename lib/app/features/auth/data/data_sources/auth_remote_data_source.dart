// ignore_for_file: parameter_assignments

import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/auth/data/models/organization_model.dart';
import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:anora/core/constants/anora_constants.dart';
import 'package:anora/core/extensions/stringx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._auth, this._firestore);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<Either<String, (AnoraUser, List<AnoraSpace>)>> login(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        // If login is successful, return the user data
        final appUser = await _getUser(user.uid);
        final spaces = await _getSpaces(appUser.organizations);
        return Right((appUser, spaces));
      } else {
        return const Left('User not found');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> logout() async {
    try {
      await _auth.signOut();

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, (AnoraUser, List<AnoraSpace>)>> signup(
    String name,
    String email,
    String password,
    String industry, {
    Invitation? invitation,
  }) async {
    try {
      final fromInvitation = invitation != null;
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        // If signup is successful, save user data to Firestore
        final orgidentifier = const Uuid().v4();
        final spaceID = const Uuid().v4();
        final userSpace = fromInvitation
            ? UserSpace(
                spaceID: invitation.uid,
                role: invitation.role,
              )
            : UserSpace(
                spaceID: spaceID,
                role: ADMIN_ROLE,
              );
        final userData = AnoraUser(
          org: orgidentifier,
          uid: user.uid,
          email: user.email!,
          names: name,
          photo: DEFAULT_PROFILE,
          organizations: [
            userSpace,
          ],
        );
        final member = fromInvitation
            ? SpaceMember(role: invitation.role, userID: user.uid)
            : SpaceMember(role: ADMIN_ROLE, userID: user.uid);
        final space = AnoraSpace(
          industry: industry,
          verified: false,
          premium: false,
          desc: userData.names.toOrganizationName,
          uid: spaceID,
          logo: DEFAULT_ORG,
          name: userData.names.toOrganizationName,
          integrations: [],
          knowledges: [],
          members: [member],
        );
        final savedUser = await _saveUser(userData);
        if (!fromInvitation) {
          await _saveSpace(space);
        } else {
          await _addUserToSpace(member, invitation.orguid);
        }

        if (!savedUser) throw Exception('User data not saved');
        return Right(
          (userData, [space]),
        );
      } else {
        return const Left('Signup failed');
      }
    } catch (e) {
      print('errrrr $e');
      return Left(e.toString());
    }
  }

  Future<AnoraUser> _getUser(String uid) async {
    try {
      final shot = await _firestore.collection('users').doc(uid).get();
      final data = shot.data();
      if (data == null) throw Exception('User data not found');
      final user = AnoraUser.fromMap(data);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> _saveUser(AnoraUser userData) async {
    try {
      await _firestore
          .collection('users')
          .doc(userData.uid)
          .set(userData.toMap());

      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> _saveSpace(AnoraSpace space) async {
    try {
      await _firestore.collection('spaces').doc(space.uid).set(space.toMap());

      return true;
    } catch (err) {
      print('errrrr $err');
      return false;
    }
  }

  Future<List<AnoraSpace>> _getSpaces(List<UserSpace> spaces) async {
    try {
      // for each space, fetch its data and return the List of all Spaces
      final allSpaces = <AnoraSpace>[];
      for (final space in spaces) {
        final shot =
            await _firestore.collection('spaces').doc(space.spaceID).get();
        final data = shot.data();
        if (data == null) throw Exception('Space data not found');
        final spaceData = AnoraSpace.fromMap(data);
        allSpaces.add(spaceData);
      }
      return allSpaces;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> _addUserToSpace(SpaceMember member, String orguid) async {
    try {
      await _firestore.collection('spaces').doc(orguid).update(
        {
          'members': FieldValue.arrayUnion(
            [
              member.toMap(),
            ],
          ),
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
