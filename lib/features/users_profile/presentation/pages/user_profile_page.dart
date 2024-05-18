import 'package:clackbox/common/common.dart';
import 'package:clackbox/constants/constants.dart';
import 'package:clackbox/features/users_profile/users_profile.dart';
import 'package:clackbox/models/models.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  final UserModel userModel;
  const UserProfilePage({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserModel copyOfUser = userModel;

    return Scaffold(
        body: ref.watch(getLatestUserProfileDataProvider).when(
              data: (data) {
                if (data.events.contains(
                    'databases.*.collections.${AppwriteConstants.usersDetailsCollectionId}.documents.${copyOfUser.userId}.update')) {
                  copyOfUser = UserModel.fromMap(data.payload);
                }
                return UserProfileDetailPage(user: copyOfUser);
              },
              error: (error, stackTrace) => ErrorText(
                error: error.toString(),
              ),
              loading: () => UserProfileDetailPage(
                user: copyOfUser,
              ),
            ));
  }
}
