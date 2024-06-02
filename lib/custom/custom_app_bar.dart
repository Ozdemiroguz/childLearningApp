// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/colors.dart';
// import '../constants/constans.dart';
// import '../gen/assets.gen.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final Widget? leading;
//   final double? leadingWidth;
//   final double bottomHeight;
//   final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;
//   final VoidCallback? onBackPressed;

//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.actions,
//     this.leading,
//     this.leadingWidth,
//     this.bottom,
//     this.bottomHeight = 0,
//     this.onBackPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 20.w,
//         right: 20.w,
//       ),
//       child: AppBar(
//         title: title != null
//             ? Text(
//                 title!,
//                 overflow: TextOverflow.ellipsis,
//               )
//             : null,
//         leading: leading ??
//             (context.router.canPop()
//                 ? IconButton.filled(
//                     onPressed: onBackPressed ?? () => context.popRoute(),
//                     style: IconButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                     ),
//                     icon: Assets.icons.arrowLeft.svg(colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
//                   )
//                 : null),
//         toolbarHeight: 44.h,
//         leadingWidth: 200.w,
//         actions: actions,
//         bottom: bottom,
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kAppBarHeight + bottomHeight + 24.h);
// }
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rota/constants/colors.dart';

import '../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? leadingText;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final double bottomHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.leadingText,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.toolbarHeight,
    this.bottom,
    this.bottomHeight = 0,
    this.onBackPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 58.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? darkBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPressed ??
                () {
                  context.router.maybePop();
                },
            child: leading ??
                Row(
                  children: [
                    GestureDetector(
                      onTap: onBackPressed ?? () => context.router.maybePop(),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: Assets.icons.arrowLeft.svg(),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      leadingText ?? "",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
          ),

          //actions null değilse ekle yoksa boş bırak
          if (actions != null)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((toolbarHeight ?? 24.h) + 80.h);
}
