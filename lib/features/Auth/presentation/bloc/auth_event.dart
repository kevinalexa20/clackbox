part of 'auth_bloc.dart';

// AppWriteClient appWriteClient = AppWriteClient();

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegisterEvent extends AuthEvent {
  final RegisterModel registerModel;

  const AuthRegisterEvent({
    required this.registerModel,
  });
}

// event untuk sign in
class AuthLoginEvent extends AuthEvent {
  final LoginModel loginModel;

  const AuthLoginEvent({
    required this.loginModel,
  });
}

// event untuk AutoLogin
class AuthAutoLoginEvent extends AuthEvent {}

// event untuk sign out
class AuthLogoutEvent extends AuthEvent {}
