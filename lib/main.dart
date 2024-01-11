import 'package:appwrite/appwrite.dart';
import 'package:clackbox/common/dependency_injection/di_container.dart';
import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:clackbox/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Client client = Client();
  // Databases database = Databases(Client());
  AppWriteClient();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

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
      ],
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(375, 825),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp.router(
              // builder: (context, widget) {
              //   //responsive Text
              //   return MediaQuery(
              //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              //     child: const LoginPage(),
              //   );
              // },
              title: 'ClackBox',
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(),
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: lightColorScheme,
                useMaterial3: true,
                textTheme: lightTextTheme,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                colorScheme: darkColorScheme,
                useMaterial3: true,
                textTheme: darkTextTheme,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              // home: const OnBoarding(),
            );
          }),
    );
  }
}
