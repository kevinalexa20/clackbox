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
      child: const Icon(
        Icons.person,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
