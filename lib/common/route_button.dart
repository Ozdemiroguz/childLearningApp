import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rota/common/circular_back_container.dart';

import '../constants/colors.dart';

class RouteButton extends StatelessWidget {
  final Widget? icon;
  final Color? color;
  final String title;
  final VoidCallback? callbackOut;
  final VoidCallback? callbackIn;
  final Widget? iconData;
  final double? paddingvertical;

  const RouteButton({
    super.key,
    this.icon,
    this.color,
    required this.title,
    this.callbackOut,
    this.callbackIn,
    this.iconData,
    this.paddingvertical,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackOut,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: paddingvertical ?? 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: bgColor,
        ),
        child: Row(
          children: [
            if (icon != null)
              Row(
                children: [
                  CircularBackContainer(
                    color: color ?? darkBgColor,
                    child: icon!,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: GestureDetector(
                onTap: callbackIn,
                child: iconData ??
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primary600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
