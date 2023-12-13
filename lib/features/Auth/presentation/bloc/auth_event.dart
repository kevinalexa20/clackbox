part of 'auth_bloc.dart';

// AppWriteClient appWriteClient = AppWriteClient();

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// event untuk sign up
// class SignUpEvent extends AuthEvent {
//   final String email;
//   final String password;
//   final String name;

//   SignUpEvent({
//     required this.email,
//     required this.password,
//     required this.name,
//   });

//   @override
//   List<Object> get props => [email, password, name];
// }

// class SignUpEvent extends AuthEvent {
//   Future<User> signup(Map map) async {
//     final response = appWriteClient.account!.create(
//         userId: map['userId'],
//         email: map['email'],
//         password: map['password'],
//         name: map['name']);
//     return response;
//   }
// }

class AuthRegisterEvent extends AuthEvent {
  final RegisterModel registerModel;

  AuthRegisterEvent({
    required this.registerModel,
  });
}

// event untuk sign in
class AuthLoginEvent extends AuthEvent {
  final LoginModel loginModel;

  AuthLoginEvent({
    required this.loginModel,
  });
}

// event untuk AutoLogin
class AuthAutoLoginEvent extends AuthEvent {}

// event untuk sign out
class AuthLogoutEvent extends AuthEvent {}
