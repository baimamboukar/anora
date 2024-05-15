import 'dart:async';

import 'package:anora/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthUseCase {
  AuthUseCase(this._repository);

  final AuthRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
