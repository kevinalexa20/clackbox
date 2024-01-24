import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/constants/reusable_text.dart';
import 'package:clackbox/common/constants/width_spacer.dart';
import 'package:clackbox/common/global_widgets/mybutton.dart';
import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/big_round_button.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/my_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                MediaQuery.of(context)
                        .platformBrightness
                        .toString()
                        .contains("dark")
                    ? Color(darkColorScheme.primary.value)
                    : Color(lightColorScheme.primary.value),
                BlendMode.srcIn,
              ),
              child: const Image(
                image: AssetImage(
                  'assets/onboard/CB-logo-outline-white.png',
                ),
                // width: 150.w,
                // height: 150.h,
                // color: Color(darkColorScheme.background.value),
              ),
            ),
            HeightSpacer(height: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                  text: "ClackBox",
                  style: TextStyle(
                    color: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.primary.value)
                        : Color(lightColorScheme.primary.value),
                    fontSize: 64,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.75),
                        blurRadius: 10,
                        offset: const Offset(0, 4.5),
                      ),
                    ],
                  ),
                ),
                ReusableText(
                  text: "It's a place to share.",
                  style: TextStyle(
                    color: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.primary.value)
                        : Color(lightColorScheme.primary.value),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.75),
                        blurRadius: 10,
                        offset: const Offset(0, 4.5),
                      ),
                    ],
                  ),
                ),
                HeightSpacer(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 400.h,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.router.push(const LoginRoute());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(250.w, 50.h),
                                        backgroundColor: MediaQuery.of(context)
                                                .platformBrightness
                                                .toString()
                                                .contains("dark")
                                            ? Color(
                                                darkColorScheme.secondary.value)
                                            : Color(lightColorScheme
                                                .secondary.value),
                                      ),
                                      child: Text(
                                        "Login here",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                HeightSpacer(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.router
                                            .push(const SignUpRoute());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(250.w, 50.h),
                                        backgroundColor: MediaQuery.of(context)
                                                .platformBrightness
                                                .toString()
                                                .contains("dark")
                                            ? Color(
                                                darkColorScheme.secondary.value)
                                            : Color(lightColorScheme
                                                .secondary.value),
                                      ),
                                      child: Text(
                                        "Register here",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                HeightSpacer(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.router
                                            .push(const BottomNavbarRoute());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(250.w, 50.h),
                                        backgroundColor: MediaQuery.of(context)
                                                .platformBrightness
                                                .toString()
                                                .contains("dark")
                                            ? Color(
                                                darkColorScheme.secondary.value)
                                            : Color(lightColorScheme
                                                .secondary.value),
                                      ),
                                      child: Text(
                                        "Continue Without Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(170.w, 60.h),
                    backgroundColor: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.secondary.value)
                        : Color(lightColorScheme.secondary.value),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: MediaQuery.of(context)
                              .platformBrightness
                              .toString()
                              .contains("dark")
                          ? Color(darkColorScheme.background.value)
                          : Color(lightColorScheme.background.value),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
