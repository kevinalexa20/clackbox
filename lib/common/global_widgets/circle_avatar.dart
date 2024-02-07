import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final ImageProvider<Object>? img;
  final double? radius;
  final Color? backgroundColor;

  const MyCircleAvatar({
    super.key,
    this.img,
    this.radius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: Icon(
        Icons.person,
        size: 18,
        color: MediaQuery.of(context)
                .platformBrightness
                .toString()
                .contains("dark")
            ? Color(darkColorScheme.primary.value)
            : Color(lightColorScheme.primary.value),
      ),
    );
  }
}
