import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/common/background_image.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../router/router.dart';
import '../providers/clock_level_provider.dart';

@RoutePage()
class ClockLevelPage extends ConsumerWidget {
  const ClockLevelPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockLevelProvider);
    return Scaffold(
      body: Stack(
        children: [
          if (state.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            state.failure.fold(
              () => BackgroundImage(
                imagePath: "assets/images/clockback.png",
                color: white,
                opacity: 0.6,
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    Padding(
                      padding: EdgeInsets.only(
                          right: 50.w, left: 50.w, bottom: 40.h),
                      child: Text(
                        textAlign: TextAlign.center,
                        "TIME EXCERCISES",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 52.sp,
                                  fontFamily: "Righteous",
                                  color: black,
                                ),
                      ),
                    ),
                    _Levels()
                  ],
                ),
              ),
              (a) => Center(
                child: Text(a.toString()),
              ),
            ),
        ],
      ),
    );
  }
}

class _Levels extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockLevel = ref.watch(clockLevelProvider);
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 54.w,
        ),
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7.w,
          mainAxisSpacing: 25.h,
        ),
        itemBuilder: (
          context,
          index,
        ) {
          return GestureDetector(
            onTap: () {
              if (clockLevel.level > index) {
                context.router.push(ClockGameRoute());
              }
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h, right: 9.w),
                  decoration: BoxDecoration(
                    color: clockLevelColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                        bottom: BorderSide(color: white, width: 1.w),
                        right: BorderSide(color: white, width: 3.w),
                        top: BorderSide(color: white, width: 1.w),
                        left: BorderSide(color: white, width: 3.w)),
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: white,
                            fontFamily: "Righteous",
                            fontSize: 60.sp,
                          ),
                    ),
                  ),
                ),
                if (index >= clockLevel.level)
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h, right: 9.w),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: white, width: 1.w),
                          right: BorderSide(color: white, width: 3.w),
                          top: BorderSide(color: white, width: 1.w),
                          left: BorderSide(color: white, width: 3.w),
                        ),
                        color: Color(0xff8B8985).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                if (index >= clockLevel.level)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Assets.images.lock.image(
                      width: 35.w,
                      height: 40.h,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
