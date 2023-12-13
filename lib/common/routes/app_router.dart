import 'package:appwrite/appwrite.dart';
import 'package:auto_route/auto_route.dart';
import 'package:clackbox/features/Auth/presentation/pages/login_page.dart';
import 'package:clackbox/features/Auth/presentation/pages/signup_page.dart';
import 'package:clackbox/features/homescreen/presentation/pages/home_page.dart';
import 'package:clackbox/features/onboarding/presentation/pages/onboarding.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/page_one.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/page_two.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: OnBoardingRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
