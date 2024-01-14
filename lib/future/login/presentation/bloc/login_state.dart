part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({@Default(BlocStatus.notInitialized) final BlocStatus statusLogin, final String? message}) =
      _LoginState;

  const LoginState._();
}
