import 'package:clackbox/constants/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color? color;
  final Color? imgColor;
  final Color? textColor;
  double? width;
  double? height;
  double? fontSize;

  MyButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.imgColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 172,
        height: height ?? 100,
        decoration: BoxDecoration(
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
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Color(lightColorScheme.onPrimary.value),
                  fontSize: fontSize ?? 16,
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
