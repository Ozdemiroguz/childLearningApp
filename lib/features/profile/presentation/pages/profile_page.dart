import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/features/test/testprovider.dart';
import 'package:rota/router/router.dart';

import '../../../../common/route_button.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: _AppBarBackgrounded(child: _ProfilePart()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProfileRouteButtons(),
          ],
        ),
      ),
    );
  }
}

class _AppBarBackgrounded extends ConsumerWidget
    implements PreferredSizeWidget {
  final Widget child;
  const _AppBarBackgrounded({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 188.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: 188.h,
              width: 360.w,
              child: Image.asset(
                'assets/images/Frame 34353.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 188.h,
              width: 360.w,
              color: const Color(
                0xff626262,
              ).withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 40.5.h,
            child: child,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(188.h);
}

class _ProfilePart extends ConsumerWidget {
  const _ProfilePart();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: 78.h,
          width: 78.w,
          decoration: BoxDecoration(
            border: Border.all(color: bgColor, width: 2.w),
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/images/Ellipse 15.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 6.5.h,
        ),
        Text(
          'Elif Öztürk',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: softBack,
              ),
        ),
      ],
    );
  }
}

class _ProfileRouteButtons extends ConsumerWidget {
  const _ProfileRouteButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: List.generate(_routes.length, (index) {
          return Column(
            children: [
              RouteButton(
                icon: _routes[index].icon.svg(),
                title: _routes[index].title,
                callbackOut: () {
                  context.router.push(_routes[index].routeInfo);
                },
                color: bgColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              if (index == 3 || index == 8)
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 12.h),
                  child: const Divider(
                    color: gray3,
                    thickness: 0.5,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _RouteInfo {
  final String title;
  final SvgGenImage icon;
  final PageRouteInfo routeInfo;

  const _RouteInfo({
    required this.title,
    required this.icon,
    required this.routeInfo,
  });
}

List<_RouteInfo> _routes = [
  _RouteInfo(
    title: 'Bilgilerim',
    icon: Assets.icons.profil,
    routeInfo: const ProfileInfoRoute(),
  ),
  _RouteInfo(
    title: 'Kayıtlı Adreslerim',
    icon: Assets.icons.mapPins,
    routeInfo: const FavoriteRoute(),
  ),
  _RouteInfo(
    title: 'Ulaşım Kartlarım',
    icon: Assets.icons.creditCard,
    routeInfo: const TransportCardsRoute(),
  ),
  _RouteInfo(
    title: 'Ödeme Yöntemlerim',
    icon: Assets.icons.cuzdan,
    routeInfo: const PaymentMethodRoute(),
  ),
  _RouteInfo(
    title: 'Favorilerim',
    icon: Assets.icons.stars,
    routeInfo: const FavoriteRoute(),
  ),
  _RouteInfo(
    title: 'Sıkça Sorulan Sorular',
    icon: Assets.icons.question,
    routeInfo: const QuestionsRoute(),
  ),
  _RouteInfo(
    title: 'Bize Ulaşın',
    icon: Assets.icons.message,
    routeInfo: const ContactUsRoute(),
  ),
  _RouteInfo(
    title: 'Gizlilik ve Güvenlik',
    icon: Assets.icons.security,
    routeInfo: const ProfileInfoRoute(),
  ),
  _RouteInfo(
    title: 'Ayarlar',
    icon: Assets.icons.settings,
    routeInfo: const ProfileInfoRoute(),
  ),
  _RouteInfo(
    title: 'Hesap Hareketlerim',
    icon: Assets.icons.walk,
    routeInfo: const AccountActivityRoute(),
  ),
  _RouteInfo(
    title: 'Çıkış Yap',
    icon: Assets.icons.exit,
    routeInfo: const ProfileInfoRoute(),
  ),
];
