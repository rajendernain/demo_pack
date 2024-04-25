part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class PageInit extends LoginState {
  @override
  String toString() => 'PageInit';
}
class PageLoading extends LoginState {}

class LoginButtonPressed extends LoginState {}

class LoginSuccess extends LoginState {
  LoginModel response;
  String message;

  LoginSuccess(this.response, this.message);
}

class LoginFailure extends LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String errorMessage;
  const LoginErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class LoginLoadedState extends LoginState {
  final LoginModel loginModel;
  const LoginLoadedState(this.loginModel);
  @override
  List<Object> get props => [];
}


class EmailValidate extends LoginState {
  final String? email;

  EmailValidate(this.email);

  @override
  String toString() => email ?? '';
}
class PasswordValidate extends LoginState {
  final String? password;

  PasswordValidate(this.password);

  @override
  String toString() => password ?? '';
}

class ClearErrMsg extends LoginState {
  final String? contact;

  ClearErrMsg({this.contact});

  @override
  String toString() => contact ?? '';
}