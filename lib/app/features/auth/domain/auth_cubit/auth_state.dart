part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.logginIn() = _LogginIn;

  const factory AuthState.singinUp() = _SigninUp;

  const factory AuthState.loginOut() = _LoginOut;

  const factory AuthState.loggedOut() = _LoggedOut;
  const factory AuthState.authenticated({required AnoraUser user}) =
      _Authenticated;
  const factory AuthState.failure() = _Failure;
  const factory AuthState.logoutFailure() = _LogoutFailure;
}
