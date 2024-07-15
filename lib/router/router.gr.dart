// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnalysingResultRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnalysingResultPage(),
      );
    },
    ChaptersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChaptersPage(),
      );
    },
    ClockLevelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClockLevelPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateAccountPage(),
      );
    },
    CrosswordRoute.name: (routeData) {
      final args = routeData.argsAs<CrosswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CrosswordPage(crossword: args.crossword),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(),
      );
    },
    IndroSliderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IndroSliderPage(),
      );
    },
    IntroRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    },
    PhoneInputRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneInputPage(),
      );
    },
    PhoneVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneVerificationPage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(
          resetToken: args.resetToken,
          userId: args.userId,
        ),
      );
    },
    UserTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserTypePage(),
      );
    },
  };
}

/// generated route for
/// [AnalysingResultPage]
class AnalysingResultRoute extends PageRouteInfo<void> {
  const AnalysingResultRoute({List<PageRouteInfo>? children})
      : super(
          AnalysingResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalysingResultRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChaptersPage]
class ChaptersRoute extends PageRouteInfo<void> {
  const ChaptersRoute({List<PageRouteInfo>? children})
      : super(
          ChaptersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChaptersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClockLevelPage]
class ClockLevelRoute extends PageRouteInfo<void> {
  const ClockLevelRoute({List<PageRouteInfo>? children})
      : super(
          ClockLevelRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClockLevelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAccountPage]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute({List<PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CrosswordPage]
class CrosswordRoute extends PageRouteInfo<CrosswordRouteArgs> {
  CrosswordRoute({
    required CrosswordGame crossword,
    List<PageRouteInfo>? children,
  }) : super(
          CrosswordRoute.name,
          args: CrosswordRouteArgs(crossword: crossword),
          initialChildren: children,
        );

  static const String name = 'CrosswordRoute';

  static const PageInfo<CrosswordRouteArgs> page =
      PageInfo<CrosswordRouteArgs>(name);
}

class CrosswordRouteArgs {
  const CrosswordRouteArgs({required this.crossword});

  final CrosswordGame crossword;

  @override
  String toString() {
    return 'CrosswordRouteArgs{crossword: $crossword}';
  }
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
/// [IndroSliderPage]
class IndroSliderRoute extends PageRouteInfo<void> {
  const IndroSliderRoute({List<PageRouteInfo>? children})
      : super(
          IndroSliderRoute.name,
          initialChildren: children,
        );

  static const String name = 'IndroSliderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroPage]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

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
/// [PhoneInputPage]
class PhoneInputRoute extends PageRouteInfo<void> {
  const PhoneInputRoute({List<PageRouteInfo>? children})
      : super(
          PhoneInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneInputRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneVerificationPage]
class PhoneVerificationRoute extends PageRouteInfo<void> {
  const PhoneVerificationRoute({List<PageRouteInfo>? children})
      : super(
          PhoneVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    String? resetToken,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            resetToken: resetToken,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.resetToken,
    this.userId,
  });

  final String? resetToken;

  final String? userId;

  @override
  String toString() {
    return 'SplashRouteArgs{resetToken: $resetToken, userId: $userId}';
  }
}

/// generated route for
/// [UserTypePage]
class UserTypeRoute extends PageRouteInfo<void> {
  const UserTypeRoute({List<PageRouteInfo>? children})
      : super(
          UserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
