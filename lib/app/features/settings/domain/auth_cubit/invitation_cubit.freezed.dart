// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvitationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inviting,
    required TResult Function() invited,
    required TResult Function() invitingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inviting,
    TResult? Function()? invited,
    TResult? Function()? invitingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inviting,
    TResult Function()? invited,
    TResult Function()? invitingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Inviting value) inviting,
    required TResult Function(_Invited value) invited,
    required TResult Function(_InvitingFailed value) invitingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Inviting value)? inviting,
    TResult? Function(_Invited value)? invited,
    TResult? Function(_InvitingFailed value)? invitingFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Inviting value)? inviting,
    TResult Function(_Invited value)? invited,
    TResult Function(_InvitingFailed value)? invitingFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationStateCopyWith<$Res> {
  factory $InvitationStateCopyWith(
          InvitationState value, $Res Function(InvitationState) then) =
      _$InvitationStateCopyWithImpl<$Res, InvitationState>;
}

/// @nodoc
class _$InvitationStateCopyWithImpl<$Res, $Val extends InvitationState>
    implements $InvitationStateCopyWith<$Res> {
  _$InvitationStateCopyWithImpl(this._value, this._then);

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
    extends _$InvitationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'InvitationState.initial()';
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
    required TResult Function() inviting,
    required TResult Function() invited,
    required TResult Function() invitingFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inviting,
    TResult? Function()? invited,
    TResult? Function()? invitingFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inviting,
    TResult Function()? invited,
    TResult Function()? invitingFailed,
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
    required TResult Function(_Inviting value) inviting,
    required TResult Function(_Invited value) invited,
    required TResult Function(_InvitingFailed value) invitingFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Inviting value)? inviting,
    TResult? Function(_Invited value)? invited,
    TResult? Function(_InvitingFailed value)? invitingFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Inviting value)? inviting,
    TResult Function(_Invited value)? invited,
    TResult Function(_InvitingFailed value)? invitingFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements InvitationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InvitingImplCopyWith<$Res> {
  factory _$$InvitingImplCopyWith(
          _$InvitingImpl value, $Res Function(_$InvitingImpl) then) =
      __$$InvitingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvitingImplCopyWithImpl<$Res>
    extends _$InvitationStateCopyWithImpl<$Res, _$InvitingImpl>
    implements _$$InvitingImplCopyWith<$Res> {
  __$$InvitingImplCopyWithImpl(
      _$InvitingImpl _value, $Res Function(_$InvitingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvitingImpl implements _Inviting {
  const _$InvitingImpl();

  @override
  String toString() {
    return 'InvitationState.inviting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvitingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inviting,
    required TResult Function() invited,
    required TResult Function() invitingFailed,
  }) {
    return inviting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inviting,
    TResult? Function()? invited,
    TResult? Function()? invitingFailed,
  }) {
    return inviting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inviting,
    TResult Function()? invited,
    TResult Function()? invitingFailed,
    required TResult orElse(),
  }) {
    if (inviting != null) {
      return inviting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Inviting value) inviting,
    required TResult Function(_Invited value) invited,
    required TResult Function(_InvitingFailed value) invitingFailed,
  }) {
    return inviting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Inviting value)? inviting,
    TResult? Function(_Invited value)? invited,
    TResult? Function(_InvitingFailed value)? invitingFailed,
  }) {
    return inviting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Inviting value)? inviting,
    TResult Function(_Invited value)? invited,
    TResult Function(_InvitingFailed value)? invitingFailed,
    required TResult orElse(),
  }) {
    if (inviting != null) {
      return inviting(this);
    }
    return orElse();
  }
}

abstract class _Inviting implements InvitationState {
  const factory _Inviting() = _$InvitingImpl;
}

/// @nodoc
abstract class _$$InvitedImplCopyWith<$Res> {
  factory _$$InvitedImplCopyWith(
          _$InvitedImpl value, $Res Function(_$InvitedImpl) then) =
      __$$InvitedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvitedImplCopyWithImpl<$Res>
    extends _$InvitationStateCopyWithImpl<$Res, _$InvitedImpl>
    implements _$$InvitedImplCopyWith<$Res> {
  __$$InvitedImplCopyWithImpl(
      _$InvitedImpl _value, $Res Function(_$InvitedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvitedImpl implements _Invited {
  const _$InvitedImpl();

  @override
  String toString() {
    return 'InvitationState.invited()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvitedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inviting,
    required TResult Function() invited,
    required TResult Function() invitingFailed,
  }) {
    return invited();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inviting,
    TResult? Function()? invited,
    TResult? Function()? invitingFailed,
  }) {
    return invited?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inviting,
    TResult Function()? invited,
    TResult Function()? invitingFailed,
    required TResult orElse(),
  }) {
    if (invited != null) {
      return invited();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Inviting value) inviting,
    required TResult Function(_Invited value) invited,
    required TResult Function(_InvitingFailed value) invitingFailed,
  }) {
    return invited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Inviting value)? inviting,
    TResult? Function(_Invited value)? invited,
    TResult? Function(_InvitingFailed value)? invitingFailed,
  }) {
    return invited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Inviting value)? inviting,
    TResult Function(_Invited value)? invited,
    TResult Function(_InvitingFailed value)? invitingFailed,
    required TResult orElse(),
  }) {
    if (invited != null) {
      return invited(this);
    }
    return orElse();
  }
}

abstract class _Invited implements InvitationState {
  const factory _Invited() = _$InvitedImpl;
}

/// @nodoc
abstract class _$$InvitingFailedImplCopyWith<$Res> {
  factory _$$InvitingFailedImplCopyWith(_$InvitingFailedImpl value,
          $Res Function(_$InvitingFailedImpl) then) =
      __$$InvitingFailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvitingFailedImplCopyWithImpl<$Res>
    extends _$InvitationStateCopyWithImpl<$Res, _$InvitingFailedImpl>
    implements _$$InvitingFailedImplCopyWith<$Res> {
  __$$InvitingFailedImplCopyWithImpl(
      _$InvitingFailedImpl _value, $Res Function(_$InvitingFailedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvitingFailedImpl implements _InvitingFailed {
  const _$InvitingFailedImpl();

  @override
  String toString() {
    return 'InvitationState.invitingFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvitingFailedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inviting,
    required TResult Function() invited,
    required TResult Function() invitingFailed,
  }) {
    return invitingFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inviting,
    TResult? Function()? invited,
    TResult? Function()? invitingFailed,
  }) {
    return invitingFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inviting,
    TResult Function()? invited,
    TResult Function()? invitingFailed,
    required TResult orElse(),
  }) {
    if (invitingFailed != null) {
      return invitingFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Inviting value) inviting,
    required TResult Function(_Invited value) invited,
    required TResult Function(_InvitingFailed value) invitingFailed,
  }) {
    return invitingFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Inviting value)? inviting,
    TResult? Function(_Invited value)? invited,
    TResult? Function(_InvitingFailed value)? invitingFailed,
  }) {
    return invitingFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Inviting value)? inviting,
    TResult Function(_Invited value)? invited,
    TResult Function(_InvitingFailed value)? invitingFailed,
    required TResult orElse(),
  }) {
    if (invitingFailed != null) {
      return invitingFailed(this);
    }
    return orElse();
  }
}

abstract class _InvitingFailed implements InvitationState {
  const factory _InvitingFailed() = _$InvitingFailedImpl;
}
