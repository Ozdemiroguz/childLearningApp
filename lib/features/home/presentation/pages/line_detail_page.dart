import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/circular_back_container.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../common/line_info.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../domain/models/line.dart';

@RoutePage()
class LineDetailPage extends ConsumerWidget {
  final Line line;

  const LineDetailPage({required this.line});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: const CustomAppBar(
        backgroundColor: darkBgColor,
        leadingText: "Sefer Saatleri",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  LineInfo(line: line),
                  SizedBox(
                    height: 20.h,
                  ),
                  DirectionButtons(),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            TimeLineButtons(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  InfoPart(),
                  SizedBox(
                    height: 16.h,
                  ),
                  HoursPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DirectionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: DepartureButton()),
        SizedBox(
          width: 8.w,
        ),
        Expanded(child: ReturnButton()),
      ],
    );
  }
}

class DepartureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: CustomFilledButton(
        child: Text(
          "Gidiş",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white),
        ),
        onPressed: () {},
      ),
    );
  }
}

class ReturnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: CustomFilledButton(
        color: white,
        child: Text(
          "Dönüş",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        onPressed: () {},
      ),
    );
  }
}

class TimeLineButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.only(right: 8.w, left: 8.w),
            child: TimeLineButton(
              active: index == 0,
              time: index == 0
                  ? "Hafta İçi"
                  : index == 1
                      ? "Cumartesi"
                      : "Pazar",
            ),
          ),
        ),
      ),
    );
    // Row(
    //   children: [
    //     Expanded(child: TimeLineButton(
    //       active: true,
    //       time: "Hafta İçi",
    //     )),
    //     SizedBox(
    //       width: 8.w,
    //     ),
    //     Expanded(child: TimeLineButton(
    //       active: false,
    //       time: "Cumart",
    //     )),
    //     SizedBox(
    //       width: 8.w,
    //     ),
    //     Expanded(child: TimeLineButton(
    //       active: false,
    //       time: "Pazar",
    //     )),
    //   ],
    // );
  }
}

class TimeLineButton extends StatelessWidget {
  final bool active;
  final String time;

  const TimeLineButton({
    required this.active,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(
          horizontal: active ? 30.w : 20.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: active ? AppColors.primary600 : white,
          borderRadius: BorderRadius.circular(51.r),
        ),
        child: Text(
          textAlign: TextAlign.center,
          time,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: active ? white : AppColors.primary600,
              ),
        ),
      ),
    );
  }
}

class InfoPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.icons.infoCircle.svg(),
        SizedBox(
          width: 9.w,
        ),
        Text(
          "Resmi tatil günleri, Pazar sefer saati ile aynıdır.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class HoursPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: const HoursInfo(
            hours: [
              "06:00",
              "06:30",
              "07:00",
              "07:30",
              "08:00",
              "08:30",
              "09:00",
              "09:30",
              "10:00",
              "10:30",
            ],
          ),
        ),
      ),
    );
  }
}

class HoursInfo extends ConsumerWidget {
  final List<String> hours;

  const HoursInfo({required this.hours});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            hours.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: index == 0
                  ? Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: CircularBackContainer(
                        color: AppColors.orange,
                        child: Text(
                          textAlign: TextAlign.center,
                          index.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: white,
                              ),
                        ),
                      ),
                    )
                  : Text(
                      textAlign: TextAlign.center,
                      hours[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.primary400,
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
