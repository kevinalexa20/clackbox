import 'package:auto_route/auto_route.dart';
import 'package:clackbox/common/global_widgets/bottom_navbar.dart';
import 'package:clackbox/features/Auth/presentation/pages/login_page.dart';
import 'package:clackbox/features/Auth/presentation/pages/signup_page.dart';
import 'package:clackbox/features/Home/presentation/pages/home_page.dart';
import 'package:clackbox/features/onboarding/presentation/pages/onboarding.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/page_one.dart';
import 'package:clackbox/features/onboarding/presentation/widgets/page_three.dart';

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
        AutoRoute(page: BottomNavbarRoute.page),
      ];
}
