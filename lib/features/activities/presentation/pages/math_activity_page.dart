import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class MathActivityPage extends ConsumerWidget {
  final int level;

  const MathActivityPage({required this.level});

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
                      "Math",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 40.sp,
                            fontFamily: "Righteous",
                            color: white,
                          ),
                    ),
                    SizedBox(height: 20.h),
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
