import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/constants/locales.dart';
import 'package:tododyst/features/profile/presentation/widdgets/profile_button.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';
import '../widdgets/profile_image.dart';
import '../widdgets/profile_route_button.dart';

@RoutePage()
class LanguagePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.maybePop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.r,
                      color: darkBlue1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              _LanguagesPart(),
              SizedBox(height: 80.h),
              ProfileButton(
                title: "Lorem Ipsum",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguagesPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(30.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: languages.length + 1,
        itemBuilder: (context, index) {
          return index == 0 ? _BuildHeader() : _BuildLanguageTile(index - 1);
        },
      ),
    );
  }
}

class _BuildHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Assets.images.languageImg.image(
            width: 30.w,
            height: 30.h,
          ),
          SizedBox(width: 10.w),
          Text(
            'Language',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 19.sp,
                ),
          ),
        ],
      ),
    );
  }
}

class _BuildLanguageTile extends ConsumerWidget {
  final int index;

  const _BuildLanguageTile(this.index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 5.w),
      child: Row(
        children: [
          Image.asset(
            languages[index]['image'].toString(),
            width: 30.w,
            height: 30.h,
          ),
          SizedBox(width: 10.w),
          Text(
            languages[index]['name'].toString(),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 19.sp,
                ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
