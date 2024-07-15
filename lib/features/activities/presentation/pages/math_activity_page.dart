import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/activities/presentation/widgets/question_bar.dart';

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
        child: Column(
          children: [
            SizedBox(height: 90.h),
            const QuestionBar(
              decimalValue: 55,
            ),
            SizedBox(height: 20.h),
            Text(
              "Math Activity Level $level",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 22.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
