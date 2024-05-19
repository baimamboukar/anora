import 'package:anora/app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:anora/app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:anora/app/features/auth/data/models/user_model.dart';
import 'package:anora/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:anora/app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
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
    final result = await useCase.signup(name, email, password, industry);
    result.fold(
      (String error) => emit(const AuthState.failure()),
      (AnoraUser user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> login(String email, String pass) async {
    final useCase = AuthUseCase(repo);
    final result = await useCase.login(email, pass);
    result.fold(
      (String error) => emit(const AuthState.failure()),
      (AnoraUser user) => emit(AuthState.authenticated(user: user)),
    );
  }
}
