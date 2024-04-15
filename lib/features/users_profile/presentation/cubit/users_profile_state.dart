part of 'users_profile_cubit.dart';

class UsersProfileState {
  // const UsersProfileState();

  final UserModel? userModel;
  final bool? isLoading;

  UsersProfileState({
    this.userModel,
    this.isLoading,
  });

  @override
  List<Object> get props => [];
}

class UsersProfileInitial extends UsersProfileState {}
