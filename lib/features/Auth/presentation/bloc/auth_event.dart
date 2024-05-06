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

//event for gettin user
class AuthGetUserEvent extends AuthEvent {
  final String userId;

  const AuthGetUserEvent({
    required this.userId,
  });
}

//event for create Oauth2 session
class OAuth2LoginEvent extends AuthEvent {
  final String provider;

  const OAuth2LoginEvent({
    required this.provider,
  });
}

// event untuk AutoLogin
class AuthAutoLoginEvent extends AuthEvent {}

// event untuk sign out
class AuthLogoutEvent extends AuthEvent {}
