import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/circular_back_container.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/features/home/presentation/widgets/widget.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../common/line_info.dart';
import '../../../home/domain/models/line.dart';

@RoutePage()
class LinePage extends ConsumerWidget {
  const LinePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 66.h,
                ),
                const LineSearchBar(),
                SizedBox(
                  height: 22.h,
                ),
                ButtonPart(),
                SizedBox(
                  height: 32.h,
                ),
                MyFavoritesButton(),
                SizedBox(
                  height: 32.h,
                ),
                LastSearches(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineSearchBar extends ConsumerWidget {
  const LineSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 56.h,
      child: CustomTextFieldBorderless(
        hintText: "Durak,hat,konum ara...",
        prefixIcon: Container(
          padding: EdgeInsets.all(16.r),
          child: Assets.icons.search.svg(),
        ),
      ),
    );
  }
}

class ButtonPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: CustomizedButton(onPressed: () {}, text: "Sefer Saatleri"),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: CustomizedButton(onPressed: () {}, text: "Sefer Saatleri"),
          ),
        ),
      ],
    );
  }
}

class MyFavoritesButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: CustomFilledButton(
        color: white,
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            children: [
              CircularBackContainer(
                child: Assets.icons.stars.svg(
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Favorilerim",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LastSearches extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Son Arananlar",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            Text(
              "Tümünü sil",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.orange,
                    color: AppColors.orange,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        const LineInfo(
          line: Line(lineCode: "Hat 1", lineName: "Hat 1", lineType: ""),
        ),
        SizedBox(
          height: 8.h,
        ),
        const LineInfo(
          line: Line(lineCode: "Hat 2", lineName: "Hat 2", lineType: ""),
        ),
        SizedBox(
          height: 8.h,
        ),
        const LineInfo(
          line: Line(lineCode: "Hat 3", lineName: "Hat 3", lineType: ""),
        ),
      ],
    );
  }
}

class CustomizedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomizedButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomFilledButton(
      color: white,
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
