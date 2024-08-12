import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/profile/presentation/widdgets/back_button.dart';
import 'package:tododyst/gen/assets.gen.dart';

@RoutePage()
class AboutPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              ProfileBackButton(),
              SizedBox(height: 80.h),
              _AboutPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(30.w),
      height: 450.h,
      child: Column(
        children: [
          Row(
            children: [
              Assets.images.abaout.image(),
              SizedBox(width: 10.w),
              Text("About", style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Tododyst is a platform that helps you to manage your daily tasks and goals. It is designed to help you to be more productive and organized.",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: darkGray),
          ),
        ],
      ),
    );
  }
}
