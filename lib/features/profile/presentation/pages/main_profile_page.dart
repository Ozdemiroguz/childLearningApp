import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../router/router.dart';

@RoutePage()
class MainProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  "Settings",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: white),
                ),
              ),
              SizedBox(height: 36.h),
              _ProfileInfo(),
              SizedBox(height: 20.h),
              _SupportAndAbout(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _RouteButton(
            image: Assets.images.profileImg,
            title: 'Account',
            onPressed: () {
              context.router.push(const AccountRoute());
            },
            isRightIcon: true,
          ),
          _RouteButton(
            image: Assets.images.childImg,
            title: 'Child Profiles',
            onPressed: () {
              context.router.push(const ChildprofileRoute());
            },
            isRightIcon: true,
          ),
          _RouteButton(
            image: Assets.images.languageImg,
            title: 'Language',
            onPressed: () {
              context.router.push(const LanguageRoute());
            },
            isRightIcon: true,
          ),
          _RouteButton(
            image: Assets.images.notifications,
            title: 'Notifications',
            onPressed: () {
              context.router.push(const NotificationsRoute());
            },
            isRightIcon: true,
          ),
          _RouteButton(
            image: Assets.images.gift,
            title: 'Use the code',
            onPressed: () {
              context.router.push(const UseCodeRoute());
            },
            isRightIcon: false,
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class _SupportAndAbout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          _RouteButton(
            image: Assets.images.support,
            title: 'Support',
            onPressed: () {},
            isRightIcon: false,
          ),
          _RouteButton(
            image: Assets.images.abaout,
            title: 'About',
            onPressed: () {},
            isRightIcon: true,
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class _RouteButton extends ConsumerWidget {
  final AssetGenImage image;
  final String title;
  final VoidCallback onPressed;
  final bool isRightIcon;

  const _RouteButton({
    required this.image,
    required this.title,
    required this.onPressed,
    required this.isRightIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            image.image(height: 30.h),
            SizedBox(width: 12.w),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 19.sp),
            ),
            Spacer(),
            if (isRightIcon)
              const Icon(
                size: 20,
                Icons.arrow_forward_ios,
                color: darkGray,
              )
          ],
        ),
      ),
    );
  }
}
