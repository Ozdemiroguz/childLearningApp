import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tododyst/constants/colors.dart';

class QuestionBar extends StatelessWidget {
  final int decimalValue;

  const QuestionBar({
    required this.decimalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: darkBlue1,
              size: 32,
            ),
          ),
          Expanded(
            child: Container(
              height: 20.h,
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: decimalValue,
                    child: Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: darkBlue1,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  Expanded(flex: 100 - decimalValue, child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}