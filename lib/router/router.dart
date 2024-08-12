import 'package:auto_route/auto_route.dart';
import 'package:tododyst/features/activities/presentation/pages/math_activity_page.dart';
import 'package:tododyst/features/crossword/presentation/pages/crossword_page.dart';
import 'package:tododyst/features/daily_goals/presentation/pages/chose_time_page.dart';
import 'package:tododyst/features/memory_game/presentation/pages/memory_game_page.dart';

import '../features/activities/presentation/pages/activites_level_page.dart';
import '../features/activities/presentation/pages/activities_chapter_page.dart';
import '../features/activities/presentation/pages/language_activity_page.dart';
import '../features/auth/presentation/pages/create_account_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/phone_input_page.dart';
import '../features/auth/presentation/pages/phone_verification_page.dart';
import '../features/auth/presentation/pages/user_type_page.dart';
import '../features/clock_game/presentation/pages/clock_game_page.dart';
import '../features/clock_game/presentation/pages/clock_level_page.dart';
import '../features/crossword/domain/models/crossword.dart';
import '../features/crossword/presentation/pages/chapters_page.dart';
import '../features/daily_goals/presentation/pages/choose_module_page.dart';
import '../features/daily_goals/presentation/pages/choose_skills_page.dart';
import '../features/daily_goals/presentation/pages/daily_goals_page.dart';
import '../features/daily_goals/presentation/pages/finish_dg_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/intro/presnetation/pages/analysing_result_page.dart';
import '../features/intro/presnetation/pages/intro_page.dart';
import '../features/intro/presnetation/pages/intro_slider_page.dart';
import '../features/memory_game/presentation/pages/memory_game_level_page.dart';
import '../features/profile/presentation/pages/about_page.dart';
import '../features/profile/presentation/pages/account_edit_page.dart';
import '../features/profile/presentation/pages/account_page.dart';
import '../features/profile/presentation/pages/childprofile_edit_page.dart';
import '../features/profile/presentation/pages/childprofile_page.dart';
import '../features/profile/presentation/pages/contact_page.dart';
import '../features/profile/presentation/pages/language_page.dart';
import '../features/profile/presentation/pages/main_profile_page.dart';
import '../features/profile/presentation/pages/notifications_page.dart';
import '../features/profile/presentation/pages/privacy_policy_page.dart';
import '../features/profile/presentation/pages/support_page.dart';
import '../features/profile/presentation/pages/use_code_page.dart';
import '../splash_page.dart';

part "router.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget|Tab,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),

        //Auth
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: PhoneInputRoute.page),
        AutoRoute(page: PhoneVerificationRoute.page),
        AutoRoute(page: UserTypeRoute.page),
        AutoRoute(page: CreateAccountRoute.page),
        //Intro
        AutoRoute(page: IntroRoute.page),
        AutoRoute(page: IndroSliderRoute.page),
        AutoRoute(page: AnalysingResultRoute.page),

        //crossword
        AutoRoute(page: ChaptersRoute.page),
        AutoRoute(page: CrosswordRoute.page),

        //Clock
        AutoRoute(page: ClockLevelRoute.page),
        AutoRoute(page: ClockGameRoute.page),

        //Memory Game
        AutoRoute(page: MemoryGameRoute.page),
        AutoRoute(page: MemoryGameLevelRoute.page),

        //Activities
        AutoRoute(page: ActivitiesChapterRoute.page),
        AutoRoute(page: ActivitesLevelRoute.page),
        AutoRoute(page: LanguageActivityRoute.page),
        AutoRoute(page: MathActivityRoute.page),

        //Daily Goals
        AutoRoute(page: ChooseModuleRoute.page),
        AutoRoute(page: ChooseSkillsRoute.page),
        AutoRoute(page: ChoseTimeRoute.page),
        AutoRoute(page: FinishDgRoute.page),
        AutoRoute(page: DailyGoalsRoute.page),

        //Profile
        AutoRoute(page: MainProfileRoute.page),
        AutoRoute(page: AccountRoute.page),
        AutoRoute(page: AccountEditRoute.page),
        AutoRoute(page: ChildprofileRoute.page),
        AutoRoute(page: ChildprofileEditRoute.page),
        AutoRoute(page: LanguageRoute.page),
        AutoRoute(page: NotificationsRoute.page),
        AutoRoute(page: UseCodeRoute.page),
        AutoRoute(page: SupportRoute.page),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: ContactRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),

        //Home
        AutoRoute(page: HomeRoute.page),
      ];
}
