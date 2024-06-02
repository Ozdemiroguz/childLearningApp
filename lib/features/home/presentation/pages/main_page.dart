import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../router/router.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        LineRoute(),
        QrRoute(),
        MapRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            padding:
                EdgeInsets.only(top: 12.h, bottom: 16.h, left: 8.w, right: 8.w),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Row(
              children: [
                CustomNavigationBarItem(
                  icon: Assets.icons.home,
                  onTap: () {
                    tabsRouter.setActiveIndex(0);
                  },
                  isActive: tabsRouter.activeIndex == 0,
                ),
                CustomNavigationBarItem(
                  icon: Assets.icons.route,
                  onTap: () {
                    tabsRouter.setActiveIndex(1);
                  },
                  isActive: tabsRouter.activeIndex == 1,
                ),
                CustomNavigationBarItem(
                  icon: Assets.icons.qrCodeOkut,
                  onTap: () {
                    context.pushRoute(const QrRoute());
                  },
                  isActive: tabsRouter.activeIndex == 2,
                ),
                CustomNavigationBarItem(
                  icon: Assets.icons.pinMap,
                  onTap: () {
                    tabsRouter.setActiveIndex(3);
                  },
                  isActive: tabsRouter.activeIndex == 3,
                ),
                CustomNavigationBarItem(
                  icon: Assets.icons.userCircle,
                  onTap: () {
                    tabsRouter.setActiveIndex(4);
                  },
                  isActive: tabsRouter.activeIndex == 4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomNavigationBarItem extends StatelessWidget {
  final SvgGenImage icon;
  final bool isActive;
  final VoidCallback onTap;

  const CustomNavigationBarItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: icon.svg(
          width: 32.w,
          height: 32.h,
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.primary600 : gray,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
