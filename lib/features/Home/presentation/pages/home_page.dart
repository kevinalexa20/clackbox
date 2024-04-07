import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/global_widgets/circle_avatar.dart';
import 'package:clackbox/features/Home/presentation/widgets/carousel_images.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: const AssetImage(
                    'assets/onboard/CB-logo-outline-white.png',
                  ),
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                  color: Theme.of(context).colorScheme.primary,
                ),
                MyCircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 165.h,
              // color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    // viewportFraction: 0.8,
                    // enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            // HeightSpacer(height: 10.h),
            Container(
              height: 150.h,
              // padding: EdgeInsets.symmetric(horizontal: 10.w),
              // margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              // width: 330.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  HeightSpacer(height: 5.h),
                  Container(
                    height: 30.h,
                    width: 400.w,
                    // color: Theme.of(context).colorScheme.onPrimary,
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //create button tab for the different screens
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //change the screen to the for you screen
                            });
                          },
                          child: Text(
                            'Category',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Text(
                          '|',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //change the screen to the popular screen
                            });
                          },
                          child: Text(
                            'Brand',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HeightSpacer(height: 10.h),
                  Row(
                    // 3 square with border radius buttons for the different categories
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // Wrap each button in a Column
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the elements vertically
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons
                                    .category, // Replace with your desired icon
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 5.h), // Spacing between icon and text
                          Text(
                            'Category', // Your button label
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        // Wrap each button in a Column
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the elements vertically
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons
                                    .category, // Replace with your desired icon
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 5.h), // Spacing between icon and text
                          Text(
                            'Category', // Your button label
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        // Wrap each button in a Column
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the elements vertically
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons
                                    .category, // Replace with your desired icon
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 5.h), // Spacing between icon and text
                          Text(
                            'Category', // Your button label
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            HeightSpacer(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'From Our Editors',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTap: () {
                      //change the screen to the popular screen
                    },
                    child: Text(
                      'See More',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(height: 15.h),
            Container(
              height: 230.h,
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 180.h,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.1),
                                blurRadius: 15,
                                offset: Offset(-5, 5),
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 0,
                    left: 30,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 200.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiary,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                AssetImage('assets/onboard/gerald-imkgdc.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 160,
                    child: Container(
                      height: 150.h,
                      width: 180.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Is Rappid Trigger just a Gimmick?",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          HeightSpacer(height: 5.h),
                          Text(
                            "Rappid Trigger is a new feature that allows you to...",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          HeightSpacer(height: 5.h),
                          Divider(
                            color: Theme.of(context).colorScheme.primary,
                            thickness: 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              //change the screen to the popular screen
                            },
                            child: Text(
                              'Category',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
