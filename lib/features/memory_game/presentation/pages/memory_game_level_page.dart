import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/common/background_image.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';
import 'package:tododyst/services/level/level_provider.dart';
import 'package:tododyst/splash_page.dart';

import '../../../../router/router.dart';

final selectedLevelProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class MemoryGameLevelPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(levelProvider);
    return Scaffold(
        body: BackgroundImage(
            imagePath: "assets/images/memorylevelback.png",
            opacity: 0.4,
            color: darkGray,
            child: Center(
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 70.h),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 35.w,
                                bottom: 50.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Assets.images.closex.image(
                                        width: 50.w,
                                        height: 50.h,
                                        fit: BoxFit.fill),
                                  ),
                                ],
                              ),
                            ),
                            Text("LEVELS",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 50.sp,
                                        fontFamily: "Righteous",
                                        color: white)),
                          ],
                        ),
                        const _Levels(),
                      ],
                    ),
            )));
  }
}

class _Levels extends ConsumerWidget {
  const _Levels();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(levelProvider);
    return Expanded(
        child: GridView.builder(
            padding: EdgeInsets.only(top: 99.h, left: 60.w, right: 60.w),
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 17.w,
                crossAxisSpacing: 17.w),
            itemBuilder: (context, index) => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (index <= state.level) {
                          ref.read(selectedLevelProvider.notifier).state =
                              index + 1;

                          context.router.push(MemoryGameRoute());
                          // ref.read(memoryGameProvider.notifier).setLevel(index);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: index <= state.level
                                ? memoryLevelColorUnlocked
                                : memoryLevelColorLocked,
                            border: Border(
                                bottom: BorderSide(color: white, width: 2.h),
                                right: BorderSide(color: white, width: 4.w),
                                left: BorderSide(color: white, width: 4.h),
                                top: BorderSide(color: white, width: 2.w)),
                            shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            "${index + 1}",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: white, fontSize: 35.sp),
                          ),
                        ),
                      ),
                    ),
                    if (index > state.level)
                      Positioned(
                        right: 0,
                        child: Assets.images.lock
                            .image(width: 20.w, height: 20.h, fit: BoxFit.fill),
                      ),
                  ],
                )));
  }
}
