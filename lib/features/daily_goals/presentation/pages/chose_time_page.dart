import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/daily_goals/presentation/providers/daily_time_provider.dart';
import 'package:tododyst/gen/assets.gen.dart';
import 'package:tododyst/router/router.dart';

import '../../../../custom/custom_filled_button.dart';

@RoutePage()
class ChoseTimePage extends ConsumerWidget {
  const ChoseTimePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 178.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
                "What time would you like to start?\n(We recommend first thing in the morning.)",
              ),
            ),
            SizedBox(height: 28.h),
            _TimePart(),
            SizedBox(height: 51.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Text(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 15.sp,
                    ),
                "Which days would you like to learn Self-Care Skills?(Everyday is the best,but we recommend picking at least five)",
              ),
            ),
            SizedBox(height: 28.h),
            _DaysPart(),
            SizedBox(height: 51.h),
            _AddButton(),
          ],
        ),
      ),
    );
  }
}

class _TimePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyTimeProvider);
    return Container(
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 24.w),
          Text(
            "${state.hour < 10 ? "0${state.hour}" : "${state.hour}"}:${state.minute < 9 ? "0${state.minute}" : "${state.minute}"}",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 36.sp, color: white, height: 1.26),
          ),
          SizedBox(width: 10.w),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(dailyTimeProvider.notifier).increaseHourAndMinute();
                },
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Assets.icons.arrowDown.svg(color: white, width: 30.w),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(dailyTimeProvider.notifier).reduceHourAndMinute();
                },
                child: Assets.icons.arrowDown.svg(color: white, width: 30.w),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DaysPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dailyTimeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _weklyDays.length,
        (index) => GestureDetector(
          onTap: () {
            ref.read(dailyTimeProvider.notifier).selectedDaysIndexes(index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.w),
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color:
                  state.selectedDaysIndexes.contains(index) ? blue : lightBlue0,
              shape: BoxShape.circle,
            ),
            child: Align(
              child: Text(
                _weklyDays[index],
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 24.sp,
                      color: state.selectedDaysIndexes.contains(index)
                          ? white
                          : darkBlue1,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: 305.w,
          child: CustomFilledButton(
            color: darkBlue1,
            buttonText: "Add",
            onPressed: () {
              context.router.replaceAll(
                [const DailyGoalsRoute()],
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {
            context.router.replaceAll(
              [const DailyGoalsRoute()],
            );
          },
          child: Text(
            "No ,thank you",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}

const _weklyDays = [
  "Su",
  "M",
  "T",
  "W",
  "Th",
  "F",
  "S",
];
