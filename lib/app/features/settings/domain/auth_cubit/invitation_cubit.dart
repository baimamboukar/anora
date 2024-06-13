import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/settings/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'invitation_cubit.freezed.dart';
part 'invitation_state.dart';

class InvitationsCubit extends Cubit<InvitationState> {
  InvitationsCubit()
      : super(
          const InvitationState.initial(),
        );
  final SettingsRepository repo = SettingsRepositoryImlp(
    SettingsRemoteDataSource(FirebaseAuth.instance, FirebaseFirestore.instance),
    SettingsLocalDataSource(),
  );

  ///===INVITATIONS===///
  Future<void> sendInvitation(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  ) async {
    final useCase = SettingsUseCase(repo);
    emit(const InvitationState.inviting());
    final result =
        await useCase.inviteUser(email, name, role, sender, org, orguid);
    result.fold(
      (String error) {
        debugPrint(error);
        emit(
          const InvitationState.invitingFailed(),
        );
      },
      (bool success) => emit(
        const InvitationState.invited(),
      ),
    );
  }

  Future<void> getInvitations(String orguid) async {
    try {
      emit(const InvitationState.gettingInvitations());

      final snapshot = await FirebaseFirestore.instance
          .collection('invitations')
          .where('orguid', isEqualTo: orguid)
          .get();

      final invitations =
          snapshot.docs.map((doc) => Invitation.fromMap(doc.data())).toList();

      emit(InvitationState.gettingInvitationsSuccess(invitations));
    } catch (e) {
      emit(InvitationState.gettingInvitationsFailed(e.toString()));
    }
  }
}
