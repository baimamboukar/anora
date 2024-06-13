part of 'knowledgebase_cubit.dart';

@freezed
abstract class KnowledgebaseState with _$KnowledgebaseState {
  const factory KnowledgebaseState.initial() = _Initial;
  const factory KnowledgebaseState.gettingDataSource() = _Creating;
  const factory KnowledgebaseState.gettingDataSourceSuccess(
    List<AnoraDataSource> sources,
  ) = _Created;
  const factory KnowledgebaseState.gettingDataSourceFailed(String err) =
      _Failed;

  const factory KnowledgebaseState.addingData() = _AddData;
  const factory KnowledgebaseState.addingDataSuccess(AnoraDataSource source) =
      _Success;
  const factory KnowledgebaseState.addingDataFailed(String err) = _AddingFailed;
}
