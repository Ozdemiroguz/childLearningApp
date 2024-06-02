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
    AccountActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AccountActivityPage(),
      );
    },
    AddNewCardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddNewCardPage(),
      );
    },
    ChargePointMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChargePointMapPage(),
      );
    },
    ChargingPointRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChargingPointPage(),
      );
    },
    ContactUsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactUsPage(),
      );
    },
    ContractRoute.name: (routeData) {
      final args = routeData.argsAs<ContractRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContractPage(
          contractName: args.contractName,
          index: args.index,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoritePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(),
      );
    },
    LineDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LineDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LineDetailPage(line: args.line),
      );
    },
    LineRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LinePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapPage(),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaymentMethodPage(),
      );
    },
    ProfileInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileInfoPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(),
      );
    },
    QrRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QrPage(),
      );
    },
    QrReadRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QrReadPage(),
      );
    },
    QuestionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuestionsPage(),
      );
    },
    RegisterInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterInfoPage(),
      );
    },
    RegisterPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPasswordPage(),
      );
    },
    RegisterPhoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPhonePage(),
      );
    },
    RegisterVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterVerificationPage(),
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
    StationtimeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StationtimePage(),
      );
    },
    TransportCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransportCardsPage(),
      );
    },
  };
}

/// generated route for
/// [AccountActivityPage]
class AccountActivityRoute extends PageRouteInfo<void> {
  const AccountActivityRoute({List<PageRouteInfo>? children})
      : super(
          AccountActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddNewCardPage]
class AddNewCardRoute extends PageRouteInfo<void> {
  const AddNewCardRoute({List<PageRouteInfo>? children})
      : super(
          AddNewCardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNewCardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChargePointMapPage]
class ChargePointMapRoute extends PageRouteInfo<void> {
  const ChargePointMapRoute({List<PageRouteInfo>? children})
      : super(
          ChargePointMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChargePointMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChargingPointPage]
class ChargingPointRoute extends PageRouteInfo<void> {
  const ChargingPointRoute({List<PageRouteInfo>? children})
      : super(
          ChargingPointRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChargingPointRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactUsPage]
class ContactUsRoute extends PageRouteInfo<void> {
  const ContactUsRoute({List<PageRouteInfo>? children})
      : super(
          ContactUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContractPage]
class ContractRoute extends PageRouteInfo<ContractRouteArgs> {
  ContractRoute({
    required String contractName,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          ContractRoute.name,
          args: ContractRouteArgs(
            contractName: contractName,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const PageInfo<ContractRouteArgs> page =
      PageInfo<ContractRouteArgs>(name);
}

class ContractRouteArgs {
  const ContractRouteArgs({
    required this.contractName,
    required this.index,
  });

  final String contractName;

  final int index;

  @override
  String toString() {
    return 'ContractRouteArgs{contractName: $contractName, index: $index}';
  }
}

/// generated route for
/// [FavoritePage]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

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
/// [LineDetailPage]
class LineDetailRoute extends PageRouteInfo<LineDetailRouteArgs> {
  LineDetailRoute({
    required Line line,
    List<PageRouteInfo>? children,
  }) : super(
          LineDetailRoute.name,
          args: LineDetailRouteArgs(line: line),
          initialChildren: children,
        );

  static const String name = 'LineDetailRoute';

  static const PageInfo<LineDetailRouteArgs> page =
      PageInfo<LineDetailRouteArgs>(name);
}

class LineDetailRouteArgs {
  const LineDetailRouteArgs({required this.line});

  final Line line;

  @override
  String toString() {
    return 'LineDetailRouteArgs{line: $line}';
  }
}

/// generated route for
/// [LinePage]
class LineRoute extends PageRouteInfo<void> {
  const LineRoute({List<PageRouteInfo>? children})
      : super(
          LineRoute.name,
          initialChildren: children,
        );

  static const String name = 'LineRoute';

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
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapPage]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentMethodPage]
class PaymentMethodRoute extends PageRouteInfo<void> {
  const PaymentMethodRoute({List<PageRouteInfo>? children})
      : super(
          PaymentMethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileInfoPage]
class ProfileInfoRoute extends PageRouteInfo<void> {
  const ProfileInfoRoute({List<PageRouteInfo>? children})
      : super(
          ProfileInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QrPage]
class QrRoute extends PageRouteInfo<void> {
  const QrRoute({List<PageRouteInfo>? children})
      : super(
          QrRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QrReadPage]
class QrReadRoute extends PageRouteInfo<void> {
  const QrReadRoute({List<PageRouteInfo>? children})
      : super(
          QrReadRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrReadRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuestionsPage]
class QuestionsRoute extends PageRouteInfo<void> {
  const QuestionsRoute({List<PageRouteInfo>? children})
      : super(
          QuestionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuestionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterInfoPage]
class RegisterInfoRoute extends PageRouteInfo<void> {
  const RegisterInfoRoute({List<PageRouteInfo>? children})
      : super(
          RegisterInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPasswordPage]
class RegisterPasswordRoute extends PageRouteInfo<void> {
  const RegisterPasswordRoute({List<PageRouteInfo>? children})
      : super(
          RegisterPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPhonePage]
class RegisterPhoneRoute extends PageRouteInfo<void> {
  const RegisterPhoneRoute({List<PageRouteInfo>? children})
      : super(
          RegisterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPhoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterVerificationPage]
class RegisterVerificationRoute extends PageRouteInfo<void> {
  const RegisterVerificationRoute({List<PageRouteInfo>? children})
      : super(
          RegisterVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterVerificationRoute';

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
/// [StationtimePage]
class StationtimeRoute extends PageRouteInfo<void> {
  const StationtimeRoute({List<PageRouteInfo>? children})
      : super(
          StationtimeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StationtimeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransportCardsPage]
class TransportCardsRoute extends PageRouteInfo<void> {
  const TransportCardsRoute({List<PageRouteInfo>? children})
      : super(
          TransportCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransportCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
