import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/appconsts.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/constants/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.myHeight,
      width: AppConst.myWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/onboard/onboard1(cr-flatwhite).png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
              child: const Image(
                image: AssetImage(
                  'assets/onboard/CB-logo-outline-white.png',
                ),
              )),
          HeightSpacer(height: 5.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "ClackBox",
                style: TextStyle(
                  color: Color(lightColorScheme.background.value),
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
                text: "It's not just a review.",
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
            ],
          ),
        ],
      ),
    );
  }
}
