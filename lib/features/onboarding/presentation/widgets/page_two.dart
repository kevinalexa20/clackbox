import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/constants/reusable_text.dart';
import 'package:clackbox/common/constants/width_spacer.dart';
import 'package:clackbox/common/global_widgets/mybutton.dart';
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
            const Image(
              image: AssetImage(
                'assets/onboard/CB-logo-outline-white.png',
              ),
              // width: 150.w,
              // height: 150.h,
              // color: Color(darkColorScheme.background.value),
            ),
            HeightSpacer(height: 5.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableText(
                  text: "ClackBox",
                  style: TextStyle(
                    color: Color(
                        ThemeData.fallback().colorScheme.onBackground.value),
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
                    color: Color(lightColorScheme.background.value),
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
                                      onPressed: () {},
                                      child: Text("Login here"),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250.w, 50.h)),
                                    ),
                                  ],
                                ),
                                HeightSpacer(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Register here"),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250.w, 50.h)),
                                    ),
                                  ],
                                ),
                                HeightSpacer(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Continue Without Login"),
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250.w, 50.h)),
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
                  child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(fixedSize: Size(150.w, 70.h)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
