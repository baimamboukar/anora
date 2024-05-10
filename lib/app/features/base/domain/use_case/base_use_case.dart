import 'dart:async';

import 'package:anora/app/features/base/domain/repositories/base_repository.dart';
import 'package:dartz/dartz.dart';

class BaseUseCase {
  BaseUseCase(this._repository);

  final BaseRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
