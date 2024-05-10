import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/constants.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  AppWriteClient();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    //ScreenUtil is for responsive UI
    return ScreenUtilInit(
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
        });
  }
}
