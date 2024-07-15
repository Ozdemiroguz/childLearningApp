import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../custom/custom_filled_button.dart';
import '../../../../router/router.dart';

@RoutePage()
class IntroPage extends ConsumerWidget {
  static const type = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Assets.images.prep1.image(
            width: 286.w,
            height: 286.h,
          ),
          Text(
            'Start Your Child Challenge Test',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 32.sp,
                  height: 1,
                ),
          ),
          SizedBox(height: 30.h),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16.sp, color: lightBlue1, height: 1.2),
          ),
          SizedBox(height: 75.h),
          _OkeyButton(),
          SizedBox(height: 15.h),
          Text('More Information',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16.sp, color: lightBlue1)),
        ],
      ),
    ));
  }
}

class _OkeyButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () {
        context.router.push(const IndroSliderRoute());
      },
      buttonText: "Okey,Let's Go!",
    );
  }
}
