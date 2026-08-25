// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

mixin _$LoginState {
  bool get canSubmit;
  bool get obscurePassword;
  bool get loginSuccess;
  String? get requiredAction;

  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);
}

abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl;

  $Res call({
    bool canSubmit,
    bool obscurePassword,
    bool loginSuccess,
    String? requiredAction,
  });
}

class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);
  final LoginState _self;
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? canSubmit = null,
    Object? obscurePassword = null,
    Object? loginSuccess = null,
    Object? requiredAction = freezed,
  }) => _then(_self.copyWith(
    canSubmit: canSubmit == null ? _self.canSubmit : canSubmit as bool,
    obscurePassword: obscurePassword == null
        ? _self.obscurePassword
        : obscurePassword as bool,
    loginSuccess: loginSuccess == null ? _self.loginSuccess : loginSuccess as bool,
    requiredAction: requiredAction == freezed
        ? _self.requiredAction
        : requiredAction as String?,
  ));
}

class _LoginState implements LoginState {
  const _LoginState({
    this.canSubmit = false,
    this.obscurePassword = true,
    this.loginSuccess = false,
    this.requiredAction,
  });

  @override final bool canSubmit;
  @override final bool obscurePassword;
  @override final bool loginSuccess;
  @override final String? requiredAction;

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) => identical(this, other) ||
      other is _LoginState &&
          other.canSubmit == canSubmit &&
          other.obscurePassword == obscurePassword &&
          other.loginSuccess == loginSuccess &&
          other.requiredAction == requiredAction;

  @override
  int get hashCode => Object.hash(
    runtimeType,
    canSubmit,
    obscurePassword,
    loginSuccess,
    requiredAction,
  );

  @override
  String toString() => 'LoginState(canSubmit: $canSubmit, '
      'obscurePassword: $obscurePassword, loginSuccess: $loginSuccess, '
      'requiredAction: $requiredAction)';
}

abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
    _LoginState value,
    $Res Function(_LoginState) then,
  ) = __$LoginStateCopyWithImpl;
}

class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(_LoginState self, $Res Function(_LoginState) then)
      : super(self, (value) => then(value as _LoginState));
}
// dart format on
