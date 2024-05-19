// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LogginInImplCopyWith<$Res> {
  factory _$$LogginInImplCopyWith(
          _$LogginInImpl value, $Res Function(_$LogginInImpl) then) =
      __$$LogginInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogginInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LogginInImpl>
    implements _$$LogginInImplCopyWith<$Res> {
  __$$LogginInImplCopyWithImpl(
      _$LogginInImpl _value, $Res Function(_$LogginInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogginInImpl implements _LogginIn {
  const _$LogginInImpl();

  @override
  String toString() {
    return 'AuthState.logginIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogginInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) {
    return logginIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) {
    return logginIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (logginIn != null) {
      return logginIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) {
    return logginIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) {
    return logginIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (logginIn != null) {
      return logginIn(this);
    }
    return orElse();
  }
}

abstract class _LogginIn implements AuthState {
  const factory _LogginIn() = _$LogginInImpl;
}

/// @nodoc
abstract class _$$SigninUpImplCopyWith<$Res> {
  factory _$$SigninUpImplCopyWith(
          _$SigninUpImpl value, $Res Function(_$SigninUpImpl) then) =
      __$$SigninUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigninUpImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigninUpImpl>
    implements _$$SigninUpImplCopyWith<$Res> {
  __$$SigninUpImplCopyWithImpl(
      _$SigninUpImpl _value, $Res Function(_$SigninUpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SigninUpImpl implements _SigninUp {
  const _$SigninUpImpl();

  @override
  String toString() {
    return 'AuthState.singinUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SigninUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) {
    return singinUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) {
    return singinUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (singinUp != null) {
      return singinUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) {
    return singinUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) {
    return singinUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (singinUp != null) {
      return singinUp(this);
    }
    return orElse();
  }
}

abstract class _SigninUp implements AuthState {
  const factory _SigninUp() = _$SigninUpImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnoraUser user});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AnoraUser,
    ));
  }
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl({required this.user});

  @override
  final AnoraUser user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated({required final AnoraUser user}) =
      _$AuthenticatedImpl;

  AnoraUser get user;
  @JsonKey(ignore: true)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl();

  @override
  String toString() {
    return 'AuthState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logginIn,
    required TResult Function() singinUp,
    required TResult Function(AnoraUser user) authenticated,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logginIn,
    TResult? Function()? singinUp,
    TResult? Function(AnoraUser user)? authenticated,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logginIn,
    TResult Function()? singinUp,
    TResult Function(AnoraUser user)? authenticated,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LogginIn value) logginIn,
    required TResult Function(_SigninUp value) singinUp,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LogginIn value)? logginIn,
    TResult? Function(_SigninUp value)? singinUp,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LogginIn value)? logginIn,
    TResult Function(_SigninUp value)? singinUp,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthState {
  const factory _Failure() = _$FailureImpl;
}
