part of 'knowledgebase_cubit.dart';

@freezed
abstract class KnowledgebaseState with _$KnowledgebaseState {
  const factory KnowledgebaseState.initial() = _Initial;
  const factory KnowledgebaseState.creating() = _Creating;
  const factory KnowledgebaseState.created() = _Created;
  const factory KnowledgebaseState.creationFailed() = _Failed;

  const factory KnowledgebaseState.addingData() = _AddData;
  const factory KnowledgebaseState.addingDataSuccess() = _Success;
  const factory KnowledgebaseState.addingDataFailed() = _AddingFailed;
}
