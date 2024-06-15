import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_chats_cubit.freezed.dart';
part 'recent_chats_state.dart';

class RecentChatsCubit extends Cubit<RecentChatsState> {
  RecentChatsCubit() : super(const RecentChatsState.initial());
}
