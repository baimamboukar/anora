import 'dart:async';

import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:anora/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  AuthUseCase(this._repository);

  final AuthRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);

  Future<Either<String, AnoraUser>> login(String email, String password) =>
      _repository.login(email, password);
  Future<Either<String, bool>> logout() => _repository.logout();
  Future<Either<String, AnoraUser>> signup(
    String name,
    String email,
    String password,
    String industry,
  ) =>
      _repository.signup(
        name,
        email,
        password,
        industry,
      );
  Future<Either<String, bool>> inviteUser(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  ) =>
      _repository.inviteUser(email, name, role, sender, org, orguid);
}