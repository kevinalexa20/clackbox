import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/constants/app_color_scheme.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/constants/width_spacer.dart';
import 'package:clackbox/common/global_widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tabs = [
    "For you",
    "Following",
    "Flex",
    "Popular",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 14;
      case 1:
        return 98;
      case 2:
        return 177;
      case 3:
        return 252;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 30.w;
      case 1:
        return 30.w;
      case 2:
        return 30.w;
      case 3:
        return 30.w;
      default:
        return 0;
    }
  }

  List<Map<String, String>> tweets = [
    {"username": "User1", "text": "This is a tweet from User1"},
    {"username": "User2", "text": "This is a tweet from User2"},
    // Add more tweets as needed
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage(
                        'assets/onboard/CB-logo-outline-white.png'),
                    width: 30.w,
                    height: 30.h,
                    fit: BoxFit.contain,
                    color: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.primary.value)
                        : Color(lightColorScheme.primary.value),
                  ),
                  MyCircleAvatar(
                    radius: 18,
                    backgroundColor: MediaQuery.of(context)
                            .platformBrightness
                            .toString()
                            .contains("dark")
                        ? Color(darkColorScheme.primary.value)
                        : Color(lightColorScheme.primary.value),
                  ),
                ],
              ),
              HeightSpacer(height: 13.h),
              //HOME CONTENT
              SizedBox(
                width: size.width.w,
                height: size.height.h,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: size.width.w,
                      height: size.height.h * 0.05,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              width: size.width.w,
                              height: size.height.h * 0.04,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tabs.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 10 : 23, top: 7),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            current = index;
                                          });
                                        },
                                        child: Text(
                                          tabs[index],
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize:
                                                current == index ? 16 : 14,
                                            fontWeight: current == index
                                                ? FontWeight.w400
                                                : FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          AnimatedPositioned(
                            curve: Curves.fastLinearToSlowEaseIn,
                            bottom: 5,
                            left: changePositionedOfLine(),
                            duration: const Duration(milliseconds: 500),
                            child: AnimatedContainer(
                              margin: const EdgeInsets.only(left: 10),
                              width: changeContainerWidth(),
                              height: size.height.h * 0.005,
                              decoration: BoxDecoration(
                                color: MediaQuery.of(context)
                                        .platformBrightness
                                        .toString()
                                        .contains("dark")
                                    ? Color(darkColorScheme.primary.value)
                                    : Color(lightColorScheme.primary.value),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      // padding: EdgeInsets.only(top: size.height.h * 0.3),
                      padding: const EdgeInsets.all(8.0),
                      // child: Text(
                      //   "${tabs[current]} Tab Content",
                      //   style: GoogleFonts.plusJakartaSans(fontSize: 30),
                      // ),
                      child: current == 0
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: tweets.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: MediaQuery.of(context)
                                            .platformBrightness
                                            .toString()
                                            .contains("dark")
                                        ? Color(darkColorScheme
                                            .primaryContainer.value)
                                        : Color(lightColorScheme
                                            .primaryContainer.value),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          MyCircleAvatar(
                                            radius: 18,
                                            backgroundColor:
                                                MediaQuery.of(context)
                                                        .platformBrightness
                                                        .toString()
                                                        .contains("dark")
                                                    ? Color(darkColorScheme
                                                        .primary.value)
                                                    : Color(lightColorScheme
                                                        .primary.value),
                                          ),
                                          WidthSpacer(width: 10),
                                          Text(
                                            tweets[index]["username"] ?? "",
                                            style: GoogleFonts.plusJakartaSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      HeightSpacer(height: 10),
                                      Text(
                                        tweets[index]["text"] ?? "",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : Text(
                              "${tabs[current]} Tab Content",
                              style: GoogleFonts.plusJakartaSans(fontSize: 30),
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
