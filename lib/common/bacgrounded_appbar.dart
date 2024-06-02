import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/colors.dart';

class BackgroundedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Widget child;
  const BackgroundedAppBar({super.key,required this.child});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 32.h),
      child: Container(
          height: 238.h,
          color:lightBgColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(top: 0,left: 0,child: Image.asset('assets/images/Ellipse 1.png'),),
              Positioned(bottom: 0,right: 0,child: Image.asset('assets/images/Ellipse 2.png'),),
              Positioned(top: 70.h,child: child,),

              
            ],
          ),
        ),
    );
}
 @override
  Size get preferredSize => Size.fromHeight(238.h);

}
