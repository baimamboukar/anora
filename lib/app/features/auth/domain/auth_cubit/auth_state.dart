part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.logginIn() = _LogginIn;

  const factory AuthState.singinUp() = _SigninUp;
  const factory AuthState.authenticated({required AnoraUser user}) =
      _Authenticated;
  const factory AuthState.failure() = _Failure;
}
