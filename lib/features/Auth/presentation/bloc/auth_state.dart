part of 'auth_bloc.dart';

@immutable
class AuthState {
  final StateStatus stateStatus;
  final String? errorMessage;
  final UserModel? userModel;

  const AuthState({
    required this.stateStatus,
    this.errorMessage,
    this.userModel,
  });

  factory AuthState.initial() =>
      const AuthState(stateStatus: StateStatus.initial);

  AuthState copyWith({
    StateStatus? stateStatus,
    String? errorMessage,
    UserModel? userModel,
  }) {
    return AuthState(
      stateStatus: stateStatus ?? this.stateStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
    );
  }
}

// abstract class AuthState extends Equatable {
//   const AuthState();  

//   @override
//   List<Object> get props => [];
// }
// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {
//   final bool isLoading;

//   AuthLoading({required this.isLoading});
// }

// class AuthSuccess extends AuthState {
//   final Account account;

//   AuthSuccess({required this.account});
// }

// class AuthFailure extends AuthState {
//   final String errorMessage;

//   AuthFailure({required this.errorMessage});

//   @override
//   List<Object> get props => [errorMessage];
// }

