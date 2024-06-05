import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledgebase_cubit.freezed.dart';
part 'knowledgebase_state.dart';

class KnowledgebaseCubit extends Cubit<KnowledgebaseState> {
  KnowledgebaseCubit() : super(const KnowledgebaseState.initial());
}
