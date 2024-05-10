import 'dart:async';

import 'package:anora/app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class SettingsUseCase {
  SettingsUseCase(this._repository);

  final SettingsRepository _repository;
  Future<Either<String, dynamic>> get(String id) => _repository.get(id);
}