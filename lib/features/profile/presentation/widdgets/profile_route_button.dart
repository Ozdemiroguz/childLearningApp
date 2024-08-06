import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';

class ProfileRouteButtons extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;
  final SvgGenImage? icon;
  const ProfileRouteButtons({
    required this.title,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: blue),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: blue),
            ),
            const Spacer(),
            if (icon != null)
              icon!.svg(
                width: 24.w,
                height: 24.h,
                color: blue,
              ),
          ],
        ),
      ),
    );
  }
}
