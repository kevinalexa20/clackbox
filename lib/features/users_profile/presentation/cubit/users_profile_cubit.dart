import 'package:bloc/bloc.dart';
import 'package:clackbox/features/Auth/constants.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';

part 'users_profile_state.dart';

class UsersProfileCubit extends Cubit<UsersProfileState> {
  final AuthRepository authRepository;

  UsersProfileCubit(this.authRepository) : super(UsersProfileInitial());

  void loadProfile(String userId) async {
    emit(UsersProfileState(isLoading: true));

    // Panggil fungsi getUserDetails.
    final user = await authRepository.getUser(userId);
    // var user = await getUserDetails(userId);

    // Update state dengan data pengguna.
    emit(UsersProfileState(isLoading: false));
  }
}
