// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavbarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavbarPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingPage(),
      );
    },
    RouteOne.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PageOne(),
      );
    },
    RouteThree.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PageThree(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    UserProfileDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserProfileDetailPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserProfilePage(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
  };
}

/// generated route for
/// [BottomNavbarPage]
class BottomNavbarRoute extends PageRouteInfo<void> {
  const BottomNavbarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavbarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PageOne]
class RouteOne extends PageRouteInfo<void> {
  const RouteOne({List<PageRouteInfo>? children})
      : super(
          RouteOne.name,
          initialChildren: children,
        );

  static const String name = 'RouteOne';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PageThree]
class RouteThree extends PageRouteInfo<void> {
  const RouteThree({List<PageRouteInfo>? children})
      : super(
          RouteThree.name,
          initialChildren: children,
        );

  static const String name = 'RouteThree';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfileDetailPage]
class UserProfileDetailRoute extends PageRouteInfo<UserProfileDetailRouteArgs> {
  UserProfileDetailRoute({
    Key? key,
    required UserModel user,
    List<PageRouteInfo>? children,
  }) : super(
          UserProfileDetailRoute.name,
          args: UserProfileDetailRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileDetailRoute';

  static const PageInfo<UserProfileDetailRouteArgs> page =
      PageInfo<UserProfileDetailRouteArgs>(name);
}

class UserProfileDetailRouteArgs {
  const UserProfileDetailRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final UserModel user;

  @override
  String toString() {
    return 'UserProfileDetailRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    Key? key,
    required UserModel userModel,
    List<PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const PageInfo<UserProfileRouteArgs> page =
      PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.userModel,
  });

  final Key? key;

  final UserModel userModel;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userModel: $userModel}';
  }
}
