import 'package:auto_route/auto_route.dart';
import 'package:clackbox/apis/apis.dart';
import 'package:clackbox/common/common.dart';
import 'package:clackbox/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);
  //state = isLoading

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        UserModel userModel = UserModel(
          userId: r.$id,
          email: email,
          name: getNameFromEmail(email),
          bio: '',
          profilePic: '',
          bannerPic: '',
          followers: [],
          following: [],
          // isVerified: false,
        );
        final res2 = await _userAPI.saveUserData(userModel);
        res2.fold(
          (l) => showSnackBar(context, l.message),
          (r) {
            context.router.push(const BottomNavbarRoute());
          },
        );
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        context.router.push(const BottomNavbarRoute());
      },
    );
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userAPI.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }

  void logout(BuildContext context) async {
    final res = await _authAPI.logout();
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        context.router.push(const OnBoardingRoute());
      },
    );
  }
}
