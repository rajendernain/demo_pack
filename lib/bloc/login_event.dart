part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class TextFieldTapped extends LoginEvent {}

class LoginTapped extends LoginEvent{
  final String email;
  final String password;

  LoginTapped(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

