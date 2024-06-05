import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'integration_cubit.freezed.dart';
part 'integration_state.dart';

class IntegrationCubit extends Cubit<IntegrationState> {
  IntegrationCubit() : super(const IntegrationState.initial());
}
