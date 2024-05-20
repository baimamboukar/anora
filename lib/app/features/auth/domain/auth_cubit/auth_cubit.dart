import 'package:anora/app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:anora/app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:anora/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:anora/app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());
  final AuthRepository repo = AuthRepositoryImlp(
    AuthRemoteDataSource(FirebaseAuth.instance, FirebaseFirestore.instance),
    AuthLocalDataSource(),
  );
  Future<void> signup(
    String name,
    String email,
    String password,
    String industry,
  ) async {
    final useCase = AuthUseCase(repo);
    emit(const AuthState.singinUp());
    final result = await useCase.signup(name, email, password, industry);
    result.fold(
      (String error) => emit(const AuthState.failure()),
      (AnoraUser user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> login(String email, String pass) async {
    final useCase = AuthUseCase(repo);
    emit(const AuthState.logginIn());
    final result = await useCase.login(email, pass);
    result.fold(
      (String error) => emit(const AuthState.failure()),
      (AnoraUser user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> logout() async {
    final useCase = AuthUseCase(repo);
    emit(const AuthState.loginOut());
    final result = await useCase.logout();
    result.fold(
      (String error) => emit(const AuthState.logoutFailure()),
      (bool success) => emit(
        const AuthState.loggedOut(),
      ),
    );
  }

  ///===INVITATIONS===///
  Future<void> sendInvitation(
    String email,
    String name,
    String role,
    String sender,
    String org,
    String orguid,
  ) async {
    final useCase = AuthUseCase(repo);
    emit(const AuthState.inviting());
    final result =
        await useCase.inviteUser(email, name, role, sender, org, orguid);
    result.fold(
      (String error) => emit(const AuthState.invitingFailed()),
      (bool success) => emit(
        const AuthState.invited(),
      ),
    );
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;
    final user = AnoraUser.fromMap(userJson);
    return userJson.isNotEmpty
        ? AuthState.authenticated(user: user)
        : const AuthState.initial();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'user': state.mapOrNull(
        authenticated: (authenticated) => authenticated.user.toMap(),
      ),
    };
  }
}
