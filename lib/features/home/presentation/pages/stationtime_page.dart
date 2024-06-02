import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/router/router.dart';

import '../../../../common/line_info.dart';
import '../../../../custom/custom_checkbox_tile.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/models/line.dart';
import '../widgets/widget.dart';

@RoutePage()
class StationtimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: const CustomAppBar(
        backgroundColor: darkBgColor,
        leadingText: "Sefer Saatleri",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              LineSearchBar(),
              SizedBox(
                height: 24.h,
              ),
              FilterAndMapSection(
                onPressed: () {
                  showModalBottomSheet(
                    elevation: 0,
                    barrierColor: Colors.transparent,
                    //arkaplan şeffaf olacak
                    context: context,
                    builder: (context) {
                      return BottomSheetContent();
                    },
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              LinesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class LineSearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextFieldBorderless(
      hintText: "Hat Ara",
      prefixIcon: Padding(
        padding: EdgeInsets.all(16.r),
        child: Assets.icons.search.svg(),
      ),
      onChanged: (value) {
        // ref.read(lineSearchProvider).state = value;
      },
    );
  }
}

class ButtonContent extends StatelessWidget {
  final String text;
  final SvgGenImage icon;

  const ButtonContent({
    required this.text,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon.svg(
          width: 24.w,
          height: 24.h,
        ),
        SizedBox(
          width: 12.w,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class LinesSection extends ConsumerWidget {
  final Line line = const Line(
    lineCode: "E-5",
    lineName: "Kadıköy - Tuzla",
    lineType: "Otobüs",
  );
  final Line line2 = const Line(
    lineCode: "E-5",
    lineName: "Kadıköy - Tuzla",
    lineType: "Tramvay",
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(
        5,
        (index) => Column(
          children: [
            GestureDetector(
              onTap: () => context.router.push(LineDetailRoute(line: line)),
              child: LineInfo(
                line: line,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () => context.router.push(LineDetailRoute(line: line2)),
              child: LineInfo(
                line: line2,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 230.h,
      padding:
          EdgeInsets.only(top: 38.w, left: 16.w, right: 16.w, bottom: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Filtrele",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Column(
            children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 13.h),
                child: CustomCheckboxTileCircular(
                  label: "Otobüs",
                  value: false,
                  onChanged: (value) {
                    // ref.read(lineTypeProvider).state = value!;
                  },
                  size: 24,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
