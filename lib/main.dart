import 'package:clackbox/common/dependency_injection/di_container.dart';
import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:clackbox/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:clackbox/features/users_profile/presentation/cubit/users_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/constants/constants.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  AppWriteClient();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();
  final DIContainer diContainer = DIContainer();

  @override
  Widget build(BuildContext context) {
    //ScreenUtil is for responsive UI
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => diContainer.authBloc,
        ),
        BlocProvider<UsersProfileCubit>(
          create: (context) => diContainer.usersProfileCubit,
        ),
        // BlocProvider(
        //   create: (_) => UsersProfileCubit(),
        // ),
      ],
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'ClackBox',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(),
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: lightColorScheme,
                useMaterial3: true,
                textTheme: lightTextTheme,
                // fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: darkColorScheme,
                useMaterial3: true,
                textTheme: darkTextTheme,
                // fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            );
          }),
    );
  }
}
