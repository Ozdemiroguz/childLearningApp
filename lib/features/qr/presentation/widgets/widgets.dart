import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';

class QrButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: CustomFilledButton(
              color: AppColors.primary800,
              onPressed: () {
                context.replaceRoute(const QrRoute());
              },
              child: const Text("Qr Göster"),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: CustomFilledButton(
              color: AppColors.primary800,
              onPressed: () {
                context.replaceRoute(const QrReadRoute());
              },
              child: const Text("Qr Okut"),
            ),
          ),
        ),
      ],
    );
  }
}

class TitlePart extends StatelessWidget {
  final Color? color;
  final String text1;
  final String text2;

  const TitlePart({
    super.key,
    this.color,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: color ?? AppColors.primary800,
              ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          text2,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: color ?? AppColors.primary800,
              ),
        ),
      ],
    );
  }
}

class XIcon extends StatelessWidget {
  final Color? color;

  const XIcon({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: GestureDetector(
          onTap: () {
            context.router.maybePop();
          },
          child: Assets.icons.carpi.svg(
            colorFilter: ColorFilter.mode(
              color ?? AppColors.primary600,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
