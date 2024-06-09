part of 'chat_cubit.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  const factory ChatState.completing() = _Completing;

  const factory ChatState.completed({required String response}) = _Completed;

  const factory ChatState.onMessage({required String message}) = _OnMessage;
  const factory ChatState.failed({required String error}) = _Failed;
}
