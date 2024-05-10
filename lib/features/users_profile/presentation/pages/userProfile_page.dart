import 'package:clackbox/features/Auth/auth.dart';
import 'package:clackbox/features/users_profile/presentation/cubit/users_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

    late UsersProfileCubit _usersProfileCubit;
    late AuthBloc _authBloc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    @override
    void initState() {
      super.initState();
      _usersProfileCubit = UsersProfileCubit(context.read<AuthRepository>());
    }

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(2, 24, 0, 0),
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () =>
                    Navigator.pop(context), // Example for a back button
              ),
              // WidthSpacer(width: 2.w),
              Text('User Profile',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                  )),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // context.router.push(SettingsPageRoute());
            },
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: false, // Disable default back button
      ),
      body: Column(
        children: [
          // UserProfileHeader(),
          // Text('User ID: ${context.read<AuthRepository>().userId}')
          // UserProfileBody(),
          // UserProfileFooter(),
        ],
      ),
    );
  }

  void _loadProfile (BuildContext context) {
    // _authBloc.add(AuthGetUserEvent(userId: context.read<AuthRepository>().userId));
  }
}
