import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';

class ProfileBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          context.router.maybePop();
        },
        child: Icon(
          color: darkBlue1,
          Icons.arrow_back,
          size: 24.r,
        ),
      ),
    );
  }
}
