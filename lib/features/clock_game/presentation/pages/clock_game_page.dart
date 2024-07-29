import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/clock_game/presentation/providers/clock_game_provider.dart';

import '../../../../common/background_image.dart';
import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';
import '../../domain/repository/models/day_time_zone.dart';
import '../providers/clock_level_provider.dart';

@RoutePage()
class ClockGamePage extends ConsumerWidget {
  final int level;
  const ClockGamePage({required this.level});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Scaffold(
      body: state.isLoading
          ? const CircularProgressIndicator.adaptive()
          : BackgroundImage(
              imagePath: "assets/images/clockgameback.png",
              color: white,
              opacity: 0,
              child: Column(
                children: [
                  SizedBox(
                    height: 75.h,
                    width: double.infinity,
                  ),
                  _Title(),
                  SizedBox(
                    height: 17.h,
                  ),
                  _Clock(),
                  SizedBox(
                    height: 35.h,
                  ),
                  _TimeZone(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _ClockAnswerPart(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _AnswerButton(
                    level: level,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _BottomPart(),
                ],
              ),
            ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: clockTitleColor,
          width: 2.w,
        ),
        color: clockTitleBack,
        borderRadius: BorderRadius.circular(35.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 48.w,
      ),
      child: Text(
        textAlign: TextAlign.center,
        "What time is it?",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 35.sp,
              fontFamily: "Righteous",
              color: clockTitleColor,
            ),
      ),
    );
  }
}

class _Clock extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Assets.images.clock.image(
          width: 216.w,
        ),
        Transform.rotate(
          angle: calculateHourAngle(
            state.questions.isEmpty
                ? 0
                : state.questions[state.currentQuestionIndex].hour,
            state.questions.isEmpty
                ? 0
                : state.questions[state.currentQuestionIndex].minute,
          ),
          child: Container(
            margin: EdgeInsets.only(
              bottom: 40.h,
            ),
            width: 5.w,
            height: 50.h,
            color: red,
          ),
        ),
        Transform.rotate(
          angle: calculateMinuteAngle(
            state.questions.isEmpty
                ? 0
                : state.questions[state.currentQuestionIndex].minute,
          ),
          child: Container(
            margin: EdgeInsets.only(
              bottom: 50.h,
            ),
            width: 5.w,
            height: 50.h,
            color: Colors.yellow,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: black,
            shape: BoxShape.circle,
          ),
          width: 10.w,
          height: 10.h,
        ),
      ],
    );
  }
}

class _TimeZone extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.25),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Assets.images.morning.image(
                height: 70.h,
              ),
            ),
            if (state.currentDayTimeZone == DayTimeZone.morning)
              Positioned.fill(
                  child: Container(
                margin: EdgeInsets.only(
                  bottom: 8.h,
                  right: 5.w,
                  left: 3.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3A).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              )),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.25),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Assets.images.noon.image(
                height: 70.h,
              ),
            ),
            if (state.currentDayTimeZone == DayTimeZone.afternoon)
              Positioned.fill(
                  child: Container(
                margin: EdgeInsets.only(
                  bottom: 8.h,
                  right: 5.w,
                  left: 3.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3A).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              )),
          ],
        ),
        SizedBox(width: 10.w),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.25),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Assets.images.night.image(
                height: 70.h,
              ),
            ),
            if (state.currentDayTimeZone == DayTimeZone.night)
              Positioned.fill(
                  child: Container(
                margin: EdgeInsets.only(
                  bottom: 8.h,
                  right: 5.w,
                  left: 3.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff3A3A3A).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              )),
          ],
        ),
      ],
    );
  }
}

class _ClockAnswerPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 47.w,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 20.h,
          bottom: 28.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.25),
              blurRadius: 4.r,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border(
              bottom: BorderSide(color: const Color(0xffDFDBC9), width: 4.w),
              right: BorderSide(color: const Color(0xffDFDBC9), width: 1.w),
              top: BorderSide(color: const Color(0xffDFDBC9), width: 1.w),
              left: BorderSide(color: const Color(0xffDFDBC9), width: 1.w)),
          color: clockTitleColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Column(
          children: [
            _ClockText(),
            SizedBox(
              height: 20.h,
            ),
            _ReduceAndIncrease(),
          ],
        ),
      ),
    );
  }
}

class _ReduceAndIncrease extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReduceAndIncreaseChip(
          icon: Assets.icons.down.svg(
            width: 19.w,
            color: state.isHourIncreased ? const Color(0xff94C5D4) : white,
          ),
          onTap: () {
            ref.read(clockGameProvider.notifier).increaseHour();
          },
          color: state.isHourIncreased ? white : const Color(0xffA2DDEF),
          borderColor: state.isHourIncreased
              ? const Color(0xffE7E7E7)
              : const Color(0xff94C5D4),
        ),
        SizedBox(
          width: 7.w,
        ),
        ReduceAndIncreaseChip(
          icon: RotatedBox(
            quarterTurns: 2,
            child: Assets.icons.down.svg(
              width: 19.w,
              color: state.isHourReduced ? const Color(0xff94C5D4) : white,
            ),
          ),
          onTap: () {
            ref.read(clockGameProvider.notifier).reduceHour();
          },
          color: state.isHourReduced ? white : const Color(0xffA2DDEF),
          borderColor: state.isHourReduced
              ? const Color(0xffE7E7E7)
              : const Color(0xff94C5D4),
        ),
        SizedBox(
          width: 25.w,
        ),
        ReduceAndIncreaseChip(
          icon: Assets.icons.down.svg(
            width: 19.w,
            color: state.isMinuteIncreased ? const Color(0xffB2E8CA) : white,
          ),
          onTap: () {
            ref.read(clockGameProvider.notifier).increaseMinute();
          },
          color: state.isMinuteIncreased ? white : const Color(0xffB2E8CA),
          borderColor: state.isMinuteIncreased
              ? const Color(0xffE7E7E7)
              : const Color(0xffA7C8B6),
        ),
        SizedBox(
          width: 7.w,
        ),
        ReduceAndIncreaseChip(
          icon: RotatedBox(
            quarterTurns: 2,
            child: Assets.icons.down.svg(
              width: 19.w,
              color: state.isMinuteReduced ? const Color(0xffB2E8CA) : white,
            ),
          ),
          onTap: () {
            ref.read(clockGameProvider.notifier).reduceMinute();
          },
          color: state.isMinuteReduced ? white : const Color(0xffB2E8CA),
          borderColor: state.isMinuteReduced
              ? const Color(0xffE7E7E7)
              : const Color(0xffA7C8B6),
        ),
      ],
    );
  }
}

class ReduceAndIncreaseChip extends ConsumerWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color color;
  final Color borderColor;

  const ReduceAndIncreaseChip({
    required this.icon,
    required this.onTap,
    required this.color,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.25),
              blurRadius: 4.r,
              offset: const Offset(0, 4),
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border(
              right: BorderSide(color: borderColor, width: 2.r),
              left: BorderSide(color: borderColor, width: 2.r),
              top: BorderSide(color: borderColor, width: 3.r),
              bottom: BorderSide(color: borderColor, width: 4.r)),
        ),
        child: icon,
      ),
    );
  }
}

class _ClockText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 36.w,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.25),
            blurRadius: 4.r,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border(
            bottom: BorderSide(color: const Color(0xffDFDBC9), width: 4.w),
            right: BorderSide(color: const Color(0xffDFDBC9), width: 1.w),
            top: BorderSide(color: const Color(0xffDFDBC9), width: 1.w),
            left: BorderSide(color: const Color(0xffDFDBC9), width: 1.w)),
        color: clockTitleColor,
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: Text(
          "${state.hour > 9 ? state.hour : "0${state.hour}"} : ${state.minute > 9 ? state.minute : "0${state.minute}"}",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 50.sp,
                fontFamily: "Righteous",
                color: black,
              )),
    );
  }
}

class _AnswerButton extends ConsumerWidget {
  final int level;

  const _AnswerButton({required this.level});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    final notifier = ref.watch(clockGameProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (state.answerButtonStates.name == "canAnswer") {
          notifier.checkAnswer();
          print("Answered");
        }
        if (state.answerButtonStates.name == "completed") {
          context.router.replaceAll([ClockLevelRoute()]);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 5.h),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.25),
                blurRadius: 4.r,
                offset: const Offset(0, 4),
              ),
            ],
            color: state.answerButtonStates.name == "initial"
                ? clockTitleColor
                : state.answerButtonStates.name == "canAnswer"
                    ? black
                    : state.answerButtonStates.name == "correct"
                        ? clockButtonColor2
                        : const Color(0xffFFCD92),
            borderRadius: BorderRadius.circular(35.r),
            border: Border(
                bottom: BorderSide(color: clockButtonColor, width: 4.w),
                right: BorderSide(color: clockButtonColor, width: 1.w),
                top: BorderSide(color: clockButtonColor, width: 1.w),
                left: BorderSide(color: clockButtonColor, width: 1.w))),
        child: Text(
          textAlign: TextAlign.center,
          state.answerButtonStates.name == "completed"
              ? " level $level  is completed"
              : state.answerButtonStates.name == "correct"
                  ? "Correct"
                  : state.answerButtonStates.name == "wrong"
                      ? "Wrong"
                      : state.answerButtonStates.name == "canAnswer"
                          ? "Done"
                          : "done",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 30.sp,
                color: state.answerButtonStates.name == "canAnswer"
                    ? white
                    : black,
                fontFamily: "Righteous",
              ),
        ),
      ),
    );
  }
}

class _BottomPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(clockGameProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.answerButtonStates.name == "correct")
          GestureDetector(
            onTap: () {
              ref.read(clockGameProvider.notifier).increaseLevel();
            },
            child: Text("Continue",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 23.sp,
                      color: white,
                      fontFamily: "Righteous",
                    )),
          ),
        if (state.answerButtonStates.name == "wrong")
          GestureDetector(
            onTap: () {
              ref.read(clockGameProvider.notifier).setInitialTime();
            },
            child: Text("Try Again",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 23.sp,
                      color: white,
                      fontFamily: "Righteous",
                    )),
          ),
        if (state.answerButtonStates.name == "correct")
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: GestureDetector(
              onTap: () {
                ref.read(clockGameProvider.notifier).setInitialTime();
              },
              child: Text("Retry",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 23.sp,
                        color: white,
                        fontFamily: "Righteous",
                      )),
            ),
          ),
      ],
    );
  }
}

double calculateHourAngle(int hour, int minute) {
  return degreesToRadians((hour * 30) + (minute * 0.5));
}

double calculateMinuteAngle(int minute) {
  return degreesToRadians(minute * 6);
}

double degreesToRadians(double degrees) {
  return degrees * (math.pi / 180);
}
