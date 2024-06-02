import 'package:auto_route/auto_route.dart';
import 'package:rota/features/auth/presentation/pages/registerinfo_page.dart';
import 'package:rota/features/profile/presentation/pages/contact_us_page.dart';
import 'package:rota/features/profile/presentation/pages/favorite_page.dart';
import 'package:rota/features/profile/presentation/pages/payment_method_page.dart';
import 'package:rota/features/profile/presentation/pages/questions_page.dart';
import 'package:rota/features/profile/presentation/pages/transport_cards_page.dart';
import 'package:rota/features/qr/presentation/pages/qr_read_page.dart';

import '../features/auth/presentation/pages/contract_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/registerpassword_page.dart';
import '../features/auth/presentation/pages/registerphone_page.dart';
import '../features/auth/presentation/pages/registerverification_page.dart';
import '../features/home/domain/models/line.dart';
import '../features/home/presentation/pages/charge_point_map_page.dart';
import '../features/home/presentation/pages/charging_point_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/line_detail_page.dart';
import '../features/home/presentation/pages/main_page.dart';
import '../features/home/presentation/pages/stationTime_page.dart';
import '../features/line/presentation/pages/line_page.dart';
import '../features/map/presentation/pages/map_page.dart';
import '../features/profile/presentation/pages/account_activity_page.dart';
import '../features/profile/presentation/pages/add_new_card_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/qr/presentation/pages/qr_page.dart';
import '../features/profile/presentation/pages/profile_info_page.dart';
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
        AutoRoute(page: RegisterPhoneRoute.page),
        AutoRoute(page: RegisterVerificationRoute.page),
        AutoRoute(page: RegisterInfoRoute.page),
        AutoRoute(page: RegisterPasswordRoute.page),
        AutoRoute(page: ContractRoute.page),
        //Navigation Bar
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: LineRoute.page),
            AutoRoute(page: QrRoute.page),
            AutoRoute(page: MapRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        //Home
        AutoRoute(page: StationtimeRoute.page),
        AutoRoute(page: LineDetailRoute.page),
        AutoRoute(page: ChargingPointRoute.page),
        AutoRoute(page: ChargePointMapRoute.page),
        //Qr
        AutoRoute(page: QrRoute.page),
        AutoRoute(page: QrReadRoute.page),

        //Profile
        AutoRoute(page: ProfileInfoRoute.page),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: QuestionsRoute.page),
        AutoRoute(page: ContactUsRoute.page),
        AutoRoute(page: TransportCardsRoute.page),
        AutoRoute(page: PaymentMethodRoute.page),
        AutoRoute(page: AddNewCardRoute.page),
        AutoRoute(page: AccountActivityRoute.page),
      ];
}
