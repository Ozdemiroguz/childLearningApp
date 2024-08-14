import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';

class TopTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TopTitle({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            bottom: 50.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Assets.images.closex
                    .image(width: 50.w, height: 50.h, fit: BoxFit.fill),
              ),
            ],
          ),
        ),
        Text(title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 50.sp, fontFamily: "Righteous", color: white)),
      ],
    );
  }
}
