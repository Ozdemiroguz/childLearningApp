import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/colors.dart';
import '../features/home/domain/models/line.dart';
import '../gen/assets.gen.dart';
import 'circular_back_container.dart';

class LineInfo extends ConsumerWidget {
  final Line line;
  final bool? isFavorite;

  const LineInfo({
    required this.line,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          CircularBackContainer(
            child: line.lineType == "Otobüs"
                ? Assets.icons.otobus.svg()
                : line.lineType == "Tramvay"
                    ? Assets.icons.tramvay.svg(
                        colorFilter:
                            const ColorFilter.mode(red, BlendMode.srcIn),
                      )
                    : line.lineType == "Yürüyüş"
                        ? Assets.icons.walk.svg() // Yürüyüş ikonu
                        : Assets.icons.araba.svg(), // Araba ikonu
          ),
          SizedBox(
            width: 6.w,
          ),
          //line code
          Text(
            line.lineCode,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColors.primary700),
          ),
          SizedBox(
            width: 6.w,
          ),
          //line name
          Expanded(
            child: Text(
              line.lineName,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isFavorite != null && isFavorite!)
            Row(
              children: [
                Assets.icons.starFilled.svg(
                  width: 20.w,
                  height: 20.h,
                ),
              ],
            )
        ],
      ),
    );
  }
}
