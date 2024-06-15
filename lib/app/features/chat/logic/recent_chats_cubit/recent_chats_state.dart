part of 'recent_chats_cubit.dart';

@freezed
class RecentChatsState with _$RecentChatsState {
  const factory RecentChatsState.initial() = _Initial;

  const factory RecentChatsState.gettingRecentChats() = _GettingRecentChats;
  // const factory RecentChatsState.gettingRecentChatsSuccess(List<Chats> chats) =
  //     _GettingRecentChatsSuccess;

  const factory RecentChatsState.gettingRecentChatsFailure(String err) =
      _GettingRecentChatsFailure;
}
