import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clackbox/common/constants/height_spacer.dart';
import 'package:clackbox/common/global_widgets/circle_avatar.dart';
import 'package:clackbox/features/Auth/constants.dart';
import 'package:clackbox/features/Home/presentation/widgets/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        // if (state.stateStatus == StateStatus.error) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text("logout"),
        //       backgroundColor: Theme.of(context).colorScheme.error,
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const LoadingWidget();
        }
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
                  ],
                ),
              ),
            ),
            actions: [
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 13, 8, 0),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onTertiary,
                    radius: 22.r,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.account_circle_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                );
              })
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      MyCircleAvatar(
                        radius: 50.r,
                        backgroundColor:
                            Theme.of(context).colorScheme.onTertiary,
                      ),
                      HeightSpacer(height: 10.h),
                      Text(
                        'Username',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    //change the screen to the home screen
                  },
                ),
                ListTile(
                  title: Text(
                    'Profile',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    //change the screen to the profile screen
                    context.router.push(UserProfileRoute());
                  },
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    //change the screen to the settings screen
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  onTap: () {
                    _logout(context);
                  },
                ),
              ],
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onTertiary,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      HeightSpacer(height: 5.h),
                      Container(
                        height: 30.h,
                        width: 400.w,
                        // color: Theme.of(context).colorScheme.onPrimary,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 7.h),
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
                      HeightSpacer(height: 15.h),
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
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons
                                        .edit_square, // Replace with your desired icon
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 5.h), // Spacing between icon and text
                              Text(
                                'CB Editorial', // Your button label
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
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
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      //change the screen to the Category screen
                                    },
                                    child: Icon(
                                      Icons
                                          .reviews, // Replace with your desired icon
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 5.h), // Spacing between icon and text
                              Text(
                                'CB Review', // Your button label
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
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
                                        .build_circle_rounded, // Replace with your desired icon
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 5.h), // Spacing between icon and text
                              Text(
                                'CB BYOK', // Your button label
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      HeightSpacer(height: 10.h),
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
                        ),
                      ),
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
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/onboard/gerald-imkgdc.png'),
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
                                  //change the screen to the Category screen
                                },
                                child: Text(
                                  'Category',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
                HeightSpacer(height: 15.h),
                Container(
                  width: size.width,
                  height: 215.h,
                  color: Theme.of(context).colorScheme.onTertiary,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.w, top: 20.h),
                            child: Text(
                              'Build Your Own Keyboard',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      HeightSpacer(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 135.h,
                            width: 355.w,
                            color: Theme.of(context).colorScheme.background,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  //change the screen to the Login/signup screen
                                },
                                child: Text(
                                  'Login/Signup to start building your own keyboard',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // void _register(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     _authBloc.add(AuthRegisterEvent(
  //         registerModel: RegisterModel(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //       name: _nameController.text,
  //     )));
  //   }
  // }

  void _logout(BuildContext context) {
    _authBloc.add(AuthLogoutEvent());
  }
}
