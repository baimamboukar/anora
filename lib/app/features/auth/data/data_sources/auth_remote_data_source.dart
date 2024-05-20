import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/auth/data/models/organization_model.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:uuid/uuid.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._auth, this._firestore);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<Either<String, AnoraUser>> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        // If login is successful, return the user data
        final appUser = await _getUser(user.uid);
        return Right(appUser);
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

  Future<Either<String, AnoraUser>> signup(
    String name,
    String email,
    String password,
    String industry,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        // If signup is successful, save user data to Firestore
        final userData = AnoraUser(
          uid: user.uid,
          email: user.email!,
          names: name,
          role: 'ADMIN',
          photo: 'USER_IMAGE',
          organizations: [
            UserOrganization(
              logo: 'ORG_LOGO',
              name: 'Xenora',
              uid: const Uuid().v4(),
              verified: false,
            ),
          ],
        );
        final saved = await _saveUser(userData);
        if (!saved) throw Exception('User data not saved');
        return Right(userData);
      } else {
        return const Left('Signup failed');
      }
    } catch (e) {
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

  Future<Either<String, bool>> inviteUser(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  ) async {
    final template = await _loadTemplate();
    final templatex = _replacePlaceholders(template, {
      'name': name,
      'sender': sender,
      'org': org,
      'role': role,
    });
    try {
      final invitation = Invitation(
        on: DateTime.now(),
        uid: const Uuid().v4(),
        text: templatex,
        subject: 'Invitation to Join $org on AnoraAI 💐',
        organization: org,
        from: From(
          name: sender,
          email: 'MS_RiPgsi@trial-yzkq340opj24d796.mlsender.net',
        ),
        role: role,
        to: [
          To(
            email: email,
            name: name,
          ),
        ],
      );

      await _firestore
          .collection('invitations')
          .doc(orguid)
          .set(invitation.toMap());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<String> _loadTemplate() async {
    try {
      final file = rootBundle.loadString('assets/invitation.html');
      return file;
    } catch (e) {
      rethrow;
    }
  }

  String _replacePlaceholders(String template, Map<String, String> variables) {
    var templatex = '';
    variables.forEach((key, value) {
      templatex = template.replaceAll('{{$key}}', value);
    });
    return templatex;
  }
}