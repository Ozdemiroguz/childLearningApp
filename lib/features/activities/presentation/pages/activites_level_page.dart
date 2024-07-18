import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';

@RoutePage()
class ActivitesLevelPage extends ConsumerWidget {
  final String activityName;

  const ActivitesLevelPage({required this.activityName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Assets.images.croswordchapback.image(
                fit: BoxFit.cover,
              ),
            ),
            //blur
            Positioned.fill(
              child: Container(
                color: darkGray2.withOpacity(0.5),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      textAlign: TextAlign.center,
                      activityName,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 40.sp,
                            fontFamily: "Righteous",
                            color: white,
                          ),
                    ),
                    SizedBox(height: 20.h),
                    _ActivityLevel(
                      activityName: activityName,
                    ),
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

class _ActivityLevel extends ConsumerWidget {
  final String activityName;

  const _ActivityLevel({required this.activityName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              activityName == "Math Skills - Activities"
                  ? context.router.replace(
                      MathActivityRoute(
                        level: index + 1,
                      ),
                    )
                  : context.router.replace(
                      LanguageActivityRoute(
                        level: index + 1,
                      ),
                    );
            },
            child: Container(
              decoration: BoxDecoration(
                color: lightGray.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: white,
                        fontSize: 32.sp,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
