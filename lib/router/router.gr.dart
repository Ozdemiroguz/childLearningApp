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
    ActivitesLevelRoute.name: (routeData) {
      final args = routeData.argsAs<ActivitesLevelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivitesLevelPage(activityName: args.activityName),
      );
    },
    ActivitiesChapterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivitiesChapterPage(),
      );
    },
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
    LanguageActivityRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageActivityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LanguageActivityPage(level: args.level),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    },
    MathActivityRoute.name: (routeData) {
      final args = routeData.argsAs<MathActivityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MathActivityPage(level: args.level),
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
/// [ActivitesLevelPage]
class ActivitesLevelRoute extends PageRouteInfo<ActivitesLevelRouteArgs> {
  ActivitesLevelRoute({
    required String activityName,
    List<PageRouteInfo>? children,
  }) : super(
          ActivitesLevelRoute.name,
          args: ActivitesLevelRouteArgs(activityName: activityName),
          initialChildren: children,
        );

  static const String name = 'ActivitesLevelRoute';

  static const PageInfo<ActivitesLevelRouteArgs> page =
      PageInfo<ActivitesLevelRouteArgs>(name);
}

class ActivitesLevelRouteArgs {
  const ActivitesLevelRouteArgs({required this.activityName});

  final String activityName;

  @override
  String toString() {
    return 'ActivitesLevelRouteArgs{activityName: $activityName}';
  }
}

/// generated route for
/// [ActivitiesChapterPage]
class ActivitiesChapterRoute extends PageRouteInfo<void> {
  const ActivitiesChapterRoute({List<PageRouteInfo>? children})
      : super(
          ActivitiesChapterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivitiesChapterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [LanguageActivityPage]
class LanguageActivityRoute extends PageRouteInfo<LanguageActivityRouteArgs> {
  LanguageActivityRoute({
    required int level,
    List<PageRouteInfo>? children,
  }) : super(
          LanguageActivityRoute.name,
          args: LanguageActivityRouteArgs(level: level),
          initialChildren: children,
        );

  static const String name = 'LanguageActivityRoute';

  static const PageInfo<LanguageActivityRouteArgs> page =
      PageInfo<LanguageActivityRouteArgs>(name);
}

class LanguageActivityRouteArgs {
  const LanguageActivityRouteArgs({required this.level});

  final int level;

  @override
  String toString() {
    return 'LanguageActivityRouteArgs{level: $level}';
  }
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
/// [MathActivityPage]
class MathActivityRoute extends PageRouteInfo<MathActivityRouteArgs> {
  MathActivityRoute({
    required int level,
    List<PageRouteInfo>? children,
  }) : super(
          MathActivityRoute.name,
          args: MathActivityRouteArgs(level: level),
          initialChildren: children,
        );

  static const String name = 'MathActivityRoute';

  static const PageInfo<MathActivityRouteArgs> page =
      PageInfo<MathActivityRouteArgs>(name);
}

class MathActivityRouteArgs {
  const MathActivityRouteArgs({required this.level});

  final int level;

  @override
  String toString() {
    return 'MathActivityRouteArgs{level: $level}';
  }
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
