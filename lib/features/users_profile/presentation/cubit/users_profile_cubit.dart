import 'package:bloc/bloc.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';
import 'package:clackbox/features/users_profile/data/datasources/user_detail_service.dart';
import 'package:equatable/equatable.dart';

part 'users_profile_state.dart';

class UsersProfileCubit extends Cubit<UsersProfileState> {
  UsersProfileCubit() : super(UsersProfileInitial());

  void loadProfile(String userId) async {
    emit(UsersProfileState(isLoading: true));

    // Panggil fungsi getUserDetails.
    var user = await getUserDetails(userId);

    // Update state dengan data pengguna.
    emit(UsersProfileState(isLoading: false));
  }
}
