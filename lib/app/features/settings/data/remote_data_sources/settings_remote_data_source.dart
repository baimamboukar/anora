// ignore_for_file: parameter_assignments

import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/settings/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class SettingsRemoteDataSource {
  SettingsRemoteDataSource(this._auth, this._firestore);
  // final ApiClient _apiClient;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  Future<Either<String, SettingsModel>> get(String id) async {
    try {
      // final result = await _apiClient.get(id);
      // if (result.response.statusCode == 200) {
      //   final resultLocal = await _localDataSource.get(id);
      //   final data = resultRemote.data;
      //   return Right(data);
      // }
      // return Left('${result.response.statusCode}:${result.response.statusMessage}');
      return Right(SettingsModel());
    } catch (e) {
      return Left(e.toString());
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
    try {
      final id = const Uuid().v4();

      final invitation = Invitation(
        orguid: orguid,
        on: DateTime.now(),
        uid: id,
        text: '',
        subject: 'Invitation to Join $org on AnoraAI 💐',
        organization: org,
        from: From(
          name: sender,
          email: 'MS_jdMa2o@trial-z86org8d210lew13.mlsender.net',
        ),
        role: role,
        to: [
          To(
            email: email,
            name: name,
          ),
        ],
      );
      final link = Uri(
        scheme: 'https',
        host: 'anora.baimamboukar.dev',
        path: 'invitation',
        queryParameters: invitation.toMap(forInvite: true),
      );
      final template = await _loadTemplate();
      final templatex = _replacePlaceholders(template, {
        'name': name,
        'sender': sender,
        'org': org,
        'role': role,
        'link': link.toString(),
      });
      await _firestore.collection('invitations').doc('$orguid-$id').set(
            invitation.copyWith(text: templatex).toMap(),
          );
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<String> _loadTemplate() async {
    try {
      final file = rootBundle.loadString('assets/email.html');
      return file;
    } catch (e) {
      rethrow;
    }
  }

  String _replacePlaceholders(String template, Map<String, String> variables) {
    variables.forEach((key, value) {
      template = template.replaceAll('{{$key}}', value);
    });
    return template;
  }
}
