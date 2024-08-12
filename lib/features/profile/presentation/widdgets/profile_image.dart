import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../constants/colors.dart';

class ProfileImage extends StatelessWidget {
  final int size;
  final String? imageUrl;
  final bool isChildAccount;
  final VoidCallback? onTap;

  const ProfileImage({
    required this.size,
    this.imageUrl,
    required this.isChildAccount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: 24.r,
            color: darkBlue1,
          ),
        ),
        const Spacer(),
        if (isChildAccount)
          GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  padding: EdgeInsets.all(20.r),
                  width: size.w,
                  height: size.h,
                  decoration: BoxDecoration(
                    image: imageUrl == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(imageUrl!),
                            fit: BoxFit.cover,
                          ),
                    color: darkBlue1,
                    shape: BoxShape.circle,
                  ),
                  child: Assets.icons.tablerMoodKidFilledSvg.svg(
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6.h, right: 6.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Assets.icons.add
                      .svg(width: 30.w, height: 30.h, color: white),
                ),
              ],
            ),
          )
        else
          GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  width: size.w,
                  height: size.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: darkBlue1, width: 6.r),
                    image: imageUrl == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(imageUrl!),
                            fit: BoxFit.cover,
                          ),
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6.h, right: 6.w),
                  width: 30.w,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    color: darkGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 20.r,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        const Spacer(),
        SizedBox(width: 24.w),
      ],
    );
  }
}
