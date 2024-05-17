import 'package:clackbox/common/common.dart';
import 'package:clackbox/features/auth/auth.dart';
import 'package:clackbox/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends ConsumerWidget {
  final UserModel user;
  const UserProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return currentUser == null
        ? Loader()
        : Scaffold(
            appBar: AppBar(
              title: Text('User Profile'),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // context.router.push(SettingsPageRoute());
                  },
                ),
              ],
              // automaticallyImplyLeading: false,
              centerTitle: false, // Disable default back button
            ),
            body: Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  color: Colors.grey,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50.sp,
                            backgroundImage: NetworkImage(currentUser
                                    .profilePic ??
                                'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                            // backgroundImage: NetworkImage(currentUser.profilePic),
                          ),
                          WidthSpacer(width: 20.w),
                          //button for edit profile
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(105.w, 40.h),
                              ),
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          WidthSpacer(width: 10.w),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(65.w, 40.h),
                              ),
                              child: //icon message
                                  Icon(
                                Icons.message,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '@user_name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      HeightSpacer(height: 2.h),
                      Text(
                        'Jakarta, Indonesia',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      HeightSpacer(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
