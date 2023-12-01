import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/app_text_theme.dart';
import 'package:clackbox/features/onboarding/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //ScreenUtil is for responsive UI
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            builder: (context, widget) {
              
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: const OnBoarding(),
              );
            },
            title: 'ClackBox',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
              textTheme: lightTextTheme,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
              textTheme: darkTextTheme,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            // home: const OnBoarding(),
          );
        });
  }
}
