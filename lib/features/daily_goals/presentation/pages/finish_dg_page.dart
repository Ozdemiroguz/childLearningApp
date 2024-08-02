import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/custom_filled_button.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../constants/colors.dart';

@RoutePage()
class FinishDgPage extends ConsumerWidget {
  const FinishDgPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.pngTransparentGoal.image(),
            SizedBox(height: 20.h),
            Text("Congratulations",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 40.sp,
                    ),),
            SizedBox(height: 20.h),
            Text("Your goal has ben added succesfully.",
                style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 40.h),
            _ButtonPart(),
          ],
        ),
      ),
    );
  }
}

class _ButtonPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: 305.w,
          child: CustomFilledButton(
            color: blue,
            buttonText: "Done",
            onPressed: () {},
          ),
        ),
        GestureDetector(
            child: Text(
          "Add one more goal!",
          style: Theme.of(context).textTheme.displaySmall,
        ),),
      ],
    );
  }
}
