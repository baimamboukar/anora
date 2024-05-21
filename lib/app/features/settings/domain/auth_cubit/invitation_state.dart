part of 'invitation_cubit.dart';

@freezed
abstract class InvitationState with _$InvitationState {
  const factory InvitationState.initial() = _Initial;

  /// Invitations
  const factory InvitationState.inviting() = _Inviting;
  const factory InvitationState.invited() = _Invited;
  const factory InvitationState.invitingFailed() = _InvitingFailed;
}
