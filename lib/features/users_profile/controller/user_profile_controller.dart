import 'dart:io';

import 'package:clackbox/apis/apis.dart';
import 'package:clackbox/core/core.dart';
import 'package:clackbox/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  return UserProfileController(
    // tweetAPI: ref.watch(tweetAPIProvider),
    storageAPI: ref.watch(storageAPIProvider),
    userAPI: ref.watch(userAPIProvider),
    // notificationController: ref.watch(notificationControllerProvider.notifier),
  );
});

// final getUserTweetsProvider = FutureProvider.family((ref, String userId) async {
//   final userProfileController =
//       ref.watch(userProfileControllerProvider.notifier);
//   return userProfileController.getUserTweets(userId);
// });

final getLatestUserProfileDataProvider = StreamProvider((ref) {
  final userAPI = ref.watch(userAPIProvider);
  return userAPI.getLatestUserProfileData();
});

class UserProfileController extends StateNotifier<bool> {
  // final TweetAPI _tweetAPI;
  final StorageAPI _storageAPI;
  final UserAPI _userAPI;
  // final NotificationController _notificationController;
  UserProfileController({
    // required TweetAPI tweetAPI,
    required StorageAPI storageAPI,
    required UserAPI userAPI,
    // required NotificationController notificationController,
  })  : 
  // _tweetAPI = tweetAPI,
        _storageAPI = storageAPI,
        _userAPI = userAPI,
        // _notificationController = notificationController,
        super(false);

  // Future<List<Tweet>> getUserTweets(String userId) async {
  //   final tweets = await _tweetAPI.getUserTweets(userId);
  //   return tweets.map((e) => Tweet.fromMap(e.data)).toList();
  // }

  void updateUserProfile({
    required UserModel userModel,
    required BuildContext context,
    required File? bannerFile,
    required File? profileFile,
  }) async {
    state = true;
    if (bannerFile != null) {
      final bannerUrl = await _storageAPI.uploadImage([bannerFile]);
      userModel = userModel.copyWith(
        bannerPic: bannerUrl[0],
      );
    }

    if (profileFile != null) {
      final profileUrl = await _storageAPI.uploadImage([profileFile]);
      userModel = userModel.copyWith(
        profilePic: profileUrl[0],
      );
    }

    final res = await _userAPI.updateUserData(userModel);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => Navigator.pop(context),
    );
  }

  // void followUser({
  //   required UserModel user,
  //   required BuildContext context,
  //   required UserModel currentUser,
  // }) async {
  //   // already following
  //   if (currentUser.following.contains(user.userId)) {
  //     user.followers.remove(currentUser.userId);
  //     currentUser.following.remove(user.userId);
  //   } else {
  //     user.followers.add(currentUser.userId);
  //     currentUser.following.add(user.userId);
  //   }

  //   user = user.copyWith(followers: user.followers);
  //   currentUser = currentUser.copyWith(
  //     following: currentUser.following,
  //   );

  //   final res = await _userAPI.followUser(user);
  //   res.fold((l) => showSnackBar(context, l.message), (r) async {
  //     final res2 = await _userAPI.addToFollowing(currentUser);
  //     res2.fold((l) => showSnackBar(context, l.message), (r) {
  //       _notificationController.createNotification(
  //         text: '${currentUser.name} followed you!',
  //         postId: '',
  //         notificationType: NotificationType.follow,
  //         userId: user.userId,
  //       );
  //     });
  //   });
  // }
}
