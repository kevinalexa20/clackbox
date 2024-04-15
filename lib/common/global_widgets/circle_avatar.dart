// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:clackbox/common/constants/app_color_scheme.dart';

class MyCircleAvatar extends StatelessWidget {
  final ImageProvider<Object>? img;
  final double? radius;
  final Color? backgroundColor;
  Function()? onTap;

  MyCircleAvatar({
    Key? key,
    this.img,
    this.radius,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      backgroundImage: img,
      child: IconButton(
        onPressed: onTap,
        // Icons.person,
        // size: 18,
        icon: Icon(
          Icons.person,
          size: 18,
          color: MediaQuery.of(context)
                  .platformBrightness
                  .toString()
                  .contains("dark")
              ? Color(darkColorScheme.primary.value)
              : Color(lightColorScheme.primary.value),
        ),
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
