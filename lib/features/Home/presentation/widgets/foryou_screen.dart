import 'package:clackbox/common/constants/constants.dart';
import 'package:clackbox/common/global_widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForyouScreen extends StatelessWidget {
  const ForyouScreen({super.key, required this.posts});

  final List<Map<String, dynamic>> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: MediaQuery.of(context)
                    .platformBrightness
                    .toString()
                    .contains("dark")
                ? Color(darkColorScheme.primaryContainer.value)
                : Color(lightColorScheme.primaryContainer.value),
            borderRadius: BorderRadius.circular(10),
          ),
          child: 
          //POST
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyCircleAvatar(
                    radius: 18,
                    backgroundColor: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.onPrimary.value)
                        : Color(lightColorScheme.onPrimary.value),
                  ),
                  WidthSpacer(width: 10.w),
                  Text(
                    posts[index]["username"] ?? "",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              HeightSpacer(height: 10.h),
              Text(
                posts[index]["text"] ?? "",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
