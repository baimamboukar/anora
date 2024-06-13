part of 'integration_cubit.dart';

@freezed
class IntegrationState with _$IntegrationState {
  const factory IntegrationState.initial() = _Initial;
  const factory IntegrationState.addingKnowledgeBase() = _AddingKnowledgeBase;
  const factory IntegrationState.addingKnowledgeBaseSuccess(
    SpaceKnowledgeBase base,
  ) = _AddingKnowledgeBaseSuccess;
  const factory IntegrationState.addingKnowledgeBaseFailure(String error) =
      _AddingKnowledgeBaseFailure;
}
