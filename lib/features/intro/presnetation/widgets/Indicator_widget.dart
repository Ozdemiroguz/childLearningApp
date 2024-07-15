import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tododyst/constants/colors.dart';

class IndicatorWidget extends StatelessWidget {
  final int counter;

  const IndicatorWidget({super.key, required this.counter});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.router.maybePop();
                // ignore: avoid_print
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 24.r,
                color: darkBlue1,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 8.h,
                    width: 47.w,
                    decoration: BoxDecoration(
                      color: counter > index ? darkBlue1 : lightBlue1,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
