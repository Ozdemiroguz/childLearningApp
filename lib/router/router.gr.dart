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
    AccountEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountEditPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountPage(),
      );
    },
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
    ChildprofileEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChildprofileEditPage(),
      );
    },
    ChildprofileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChildprofilePage(),
      );
    },
    ChooseModuleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseModulePage(),
      );
    },
    ChooseSkillsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseSkillsPage(),
      );
    },
    ChoseTimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChoseTimePage(),
      );
    },
    ClockGameRoute.name: (routeData) {
      final args = routeData.argsAs<ClockGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClockGamePage(level: args.level),
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
    DailyGoalsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DailyGoalsPage(),
      );
    },
    FinishDgRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FinishDgPage(),
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
    LanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LanguagePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    },
    MainProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainProfilePage(),
      );
    },
    MathActivityRoute.name: (routeData) {
      final args = routeData.argsAs<MathActivityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MathActivityPage(level: args.level),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationsPage(),
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
    UseCodeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UseCodePage(),
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
/// [AccountEditPage]
class AccountEditRoute extends PageRouteInfo<void> {
  const AccountEditRoute({List<PageRouteInfo>? children})
      : super(
          AccountEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ChildprofileEditPage]
class ChildprofileEditRoute extends PageRouteInfo<void> {
  const ChildprofileEditRoute({List<PageRouteInfo>? children})
      : super(
          ChildprofileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChildprofileEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChildprofilePage]
class ChildprofileRoute extends PageRouteInfo<void> {
  const ChildprofileRoute({List<PageRouteInfo>? children})
      : super(
          ChildprofileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChildprofileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseModulePage]
class ChooseModuleRoute extends PageRouteInfo<void> {
  const ChooseModuleRoute({List<PageRouteInfo>? children})
      : super(
          ChooseModuleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseModuleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseSkillsPage]
class ChooseSkillsRoute extends PageRouteInfo<void> {
  const ChooseSkillsRoute({List<PageRouteInfo>? children})
      : super(
          ChooseSkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseSkillsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChoseTimePage]
class ChoseTimeRoute extends PageRouteInfo<void> {
  const ChoseTimeRoute({List<PageRouteInfo>? children})
      : super(
          ChoseTimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoseTimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClockGamePage]
class ClockGameRoute extends PageRouteInfo<ClockGameRouteArgs> {
  ClockGameRoute({
    required int level,
    List<PageRouteInfo>? children,
  }) : super(
          ClockGameRoute.name,
          args: ClockGameRouteArgs(level: level),
          initialChildren: children,
        );

  static const String name = 'ClockGameRoute';

  static const PageInfo<ClockGameRouteArgs> page =
      PageInfo<ClockGameRouteArgs>(name);
}

class ClockGameRouteArgs {
  const ClockGameRouteArgs({required this.level});

  final int level;

  @override
  String toString() {
    return 'ClockGameRouteArgs{level: $level}';
  }
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
/// [DailyGoalsPage]
class DailyGoalsRoute extends PageRouteInfo<void> {
  const DailyGoalsRoute({List<PageRouteInfo>? children})
      : super(
          DailyGoalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DailyGoalsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinishDgPage]
class FinishDgRoute extends PageRouteInfo<void> {
  const FinishDgRoute({List<PageRouteInfo>? children})
      : super(
          FinishDgRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinishDgRoute';

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
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

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
/// [MainProfilePage]
class MainProfileRoute extends PageRouteInfo<void> {
  const MainProfileRoute({List<PageRouteInfo>? children})
      : super(
          MainProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainProfileRoute';

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
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

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
/// [UseCodePage]
class UseCodeRoute extends PageRouteInfo<void> {
  const UseCodeRoute({List<PageRouteInfo>? children})
      : super(
          UseCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'UseCodeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
