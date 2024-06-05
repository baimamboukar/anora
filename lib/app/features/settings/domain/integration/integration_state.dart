part of 'integration_cubit.dart';

@freezed
abstract class IntegrationState with _$IntegrationState {
  const factory IntegrationState.initial() = _Initial;

  const factory IntegrationState.adding() = _Adding;

  const factory IntegrationState.added(String type) = _Added;

  const factory IntegrationState.failed(String error) = _Error;
}
