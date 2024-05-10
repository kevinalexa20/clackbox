import 'package:clackbox/constants/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigRoundButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? color;
  final Color? imgColor;
  final Color? textColor;
  final ImageProvider<Object>? imageAuth;

  const BigRoundButton(
      {super.key,
      required this.text,
      this.onTap,
      this.color,
      required this.imageAuth,
      this.imgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 172,
        height: 137,
        decoration: BoxDecoration(
          // color: color ??
          //     Color(Theme.of(context).brightness == Brightness.light
          //         ? 0xFFF4D9FF
          //         : 0xFF7000A8),
          color: color ?? Color(lightColorScheme.primary.value),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4.5),
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Image(
                  image:
                      imageAuth ?? const AssetImage('assets/onboard/login.png'),
                  width: 50.w,
                  height: 50.h,
                  color: imgColor,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Color(lightColorScheme.onPrimary.value),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
