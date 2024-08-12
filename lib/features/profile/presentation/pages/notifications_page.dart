import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/profile/presentation/widdgets/back_button.dart';
import 'package:tododyst/gen/assets.gen.dart';

@RoutePage()
class NotificationsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              ProfileBackButton(),
              SizedBox(height: 80.h),
              _PastNotifications(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PastNotifications extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(30.w),
      height: 500.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notifications",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 22.h),
          Text("Today", style: Theme.of(context).textTheme.displaySmall),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: index == 2
                        ? null
                        : const Border(
                            bottom: BorderSide(color: darkGray),
                          ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Assets.images.notifications.image(),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: darkGray),
                          ),
                          Text(
                            "10:31",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: darkGray,
                                  fontSize: 10.sp,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text("Yesterday", style: Theme.of(context).textTheme.displaySmall),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: index == 2
                        ? null
                        : const Border(
                            bottom: BorderSide(color: darkGray),
                          ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Assets.images.notifications.image(),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum Dolor Sit Amet",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: darkGray),
                          ),
                          Text(
                            "10:31",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: darkGray,
                                  fontSize: 10.sp,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
