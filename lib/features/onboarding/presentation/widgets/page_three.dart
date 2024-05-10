import 'package:auto_route/auto_route.dart';
import 'package:clackbox/constants/constants.dart';
import 'package:clackbox/common/routes/app_router.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/big_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  // bool isOnSignup = false;
  // bool isOnLogin = false;
  bool isButtonPress = false;
  bool userPressLogin = false;
  bool userPressSignup = false;
  String _userChoice = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.myWidth,
      height: AppConst.myHeight,
      // color: Color(lightColorScheme.background.value),
      decoration: BoxDecoration(
        color: Color(lightColorScheme.background.value),
        image: DecorationImage(
          image: const AssetImage('assets/onboard/gerald-imkgdc.png'),
          fit: BoxFit.none,
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
            const Color(0xFFFDFBFF).withOpacity(0.1),
            BlendMode.color,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeightSpacer(height: 200.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
              child: Image(
                image: const AssetImage(
                  'assets/onboard/CB-logo-outline-white.png',
                ),
                width: 150.w,
                height: 150.h,
                color: Color(darkColorScheme.background.value),
              )),
          HeightSpacer(height: 5.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "ClackBox",
                style: TextStyle(
                  color: Color(darkColorScheme.background.value),
                  fontSize: 40,
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
            ],
          ),
          HeightSpacer(height: 30.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: userPressSignup
                          ? Color(lightColorScheme.secondary.value)
                          : Color(darkColorScheme.background.value)),
                  onPressed: () {
                    // setState(() {
                    //   if (userPressSignup == false) {
                    //     userPressLogin = true;
                    //   } else {
                    //     userPressSignup = false;
                    //   }
                    // });
                    setState(() {
                      userPressSignup = !userPressSignup;
                    });
                    _userChoice = "signup";
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
                WidthSpacer(width: 30.w),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: userPressLogin
                        ? Color(lightColorScheme.secondary.value)
                        : Color(darkColorScheme.background.value),
                  ),
                  onPressed: () {
                    // setState(() {
                    //   if (userPressLogin == false) {
                    //     userPressSignup = true;
                    //   } else {
                    //     userPressLogin = false;
                    //   }
                    // });
                    setState(() {
                      userPressLogin = !userPressLogin;
                    });
                    _userChoice = "login";
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeightSpacer(height: 1.h),
          HeightSpacer(height: 20.h),
          ReusableText(
            text: "With",
            style: TextStyle(
              color: Color(darkColorScheme.background.value),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          HeightSpacer(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigRoundButton(
                imageAuth: const AssetImage('assets/onboard/google-logo.png'),
                color: Color(darkColorScheme.background.value),
                text: "Google",
                onTap: () {},
              ),
              WidthSpacer(width: 10.w),
              BigRoundButton(
                imageAuth: const AssetImage('assets/onboard/mail.png'),
                text: "Email",
                textColor: Color(darkColorScheme.background.value),
                onTap: () {
                  if (_userChoice == "login") {
                    context.router.push(const LoginRoute());
                  } else if (_userChoice == "signup") {
                    context.router.push(SignUpRoute());
                  } else {
                    print("No user choice");
                  }
                },
                color: Color(darkColorScheme.outline.value),
                imgColor: Color(darkColorScheme.background.value),
              ),
            ],
          ),
          HeightSpacer(height: 20.h),
          TextButton(
              onPressed: () {},
              child: Text(
                "Continue as Guest",
                style: TextStyle(
                  color: Color(darkColorScheme.outline.value),
                  fontSize: 16,
                  // fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
