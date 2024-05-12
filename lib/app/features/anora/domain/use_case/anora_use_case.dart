import 'dart:async';

import 'package:anora/app/features/anora/domain/repositories/anora_repository.dart';
import 'package:dartz/dartz.dart';

class AnoraUseCase {
  AnoraUseCase(this._repository);

  final AnoraRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}
