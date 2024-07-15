import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';

@RoutePage()
class AnalysingResultPage extends ConsumerWidget {
  const AnalysingResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.prep5.image(
              height: 364.h,
            ),
            Text("Analyzing results", style: TextStyle(fontSize: 32.sp)),
            SizedBox(height: 12.h),
            Text("Please wait...",
                style: TextStyle(fontSize: 20.sp, color: lightBlue1)),
          ],
        ),
      ),
    );
  }
}
