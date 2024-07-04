import 'package:auto_route/auto_route.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/phone_input_page.dart';
import '../features/auth/presentation/pages/phone_verification_page.dart';
import '../features/auth/presentation/pages/user_type_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/intro/presnetation/pages/intro_page.dart';
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
        //Intro
        AutoRoute(page: IntroRoute.page),

        //Home
        AutoRoute(page: HomeRoute.page),
      ];
}
