import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../router/router.dart';

@RoutePage()
class ActivitiesChapterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            //blur

            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      "Chapters",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 40.sp,
                            fontFamily: "Righteous",
                          ),
                    ),
                    SizedBox(height: 20.h),
                    _Chapters(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chapters extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GridView.builder(
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.router.push(
                ActivitesLevelRoute(
                  activityName: index == 0
                      ? "Math Skills - Activities"
                      : "Reading Skills - Activities",
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  index == 0
                      ? "Math Skills - Activities"
                      : "Language Skills - Activities",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
