import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/activities/presentation/widgets/question_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';
import '../providers/math_provider.dart';

@RoutePage()
class MathActivityPage extends ConsumerWidget {
  final int level;

  const MathActivityPage({required this.level});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathProvider);
    return Scaffold(
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: [
                  SizedBox(height: 90.h),
                  QuestionBar(
                    decimalValue: state.answers.isEmpty
                        ? 0
                        : ((state.currentQuestion / state.answers.length) * 100)
                            .toInt(),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Math Activity Level $level",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 22.sp,
                        ),
                  ),
                  SizedBox(height: 20.h),
                  _QuestionPart(),
                  SizedBox(height: 20.h),
                  _Options(),
                  SizedBox(height: 20.h),
                  _NextButton(),
                ],
              ),
            ),
    );
  }
}

class _QuestionPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 200.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
          textAlign: TextAlign.center,
          state.questions.isEmpty ? "" : state.questions[state.currentQuestion],
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 52.sp,
                color: darkBlue1,
              )),
    );
  }
}

class _Options extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathProvider);
    return Column(
      children: List.generate(
        state.options.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: _Option(
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Option extends ConsumerWidget {
  final int index;

  const _Option({required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathProvider);
    final notifier = ref.watch(mathProvider.notifier);
    return GestureDetector(
      onTap: () {
        notifier.setSelectedOption(index);
      },
      child: Container(
        width: 361.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: lightGray,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: state.selectedOption == null
                ? lightGray
                : (state.isCorrect && state.selectedOption == index)
                    ? green
                    : (state.isAnswered &&
                            state.selectedOption == index &&
                            !state.isCorrect)
                        ? orange
                        : state.selectedOption == index
                            ? darkBlue1
                            : lightGray,
            width: 2.w,
          ),
        ),
        child: Center(
          child: Text(
            state.options[index],
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 18.sp,
                  color: darkGray1,
                ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mathProvider);

    return SizedBox(
      width: 305.w,
      height: 45.h,
      child: CustomFilledButton(
        color: state.color,
        onPressed: () {
          if (!state.isAnswered && !state.isCorrect) {
            ref.read(mathProvider.notifier).checkAnswer();
          } else if (state.isAnswered && !state.isCorrect) {
            ref.read(mathProvider.notifier).wrongAnswer();
          } else {
            if (state.currentQuestion < state.answers.length - 1) {
              ref.read(mathProvider.notifier).nextQuestion();
            } else {
              context.router.replace(ActivitesLevelRoute(
                activityName: "Math Skills - Activities",
              ));
            }
          }
        },
        child: Text(
          state.isCorrect
              ? "Right"
              : (state.isAnswered && !state.isCorrect)
                  ? "Wrong"
                  : "Check",
        ),
      ),
    );
  }
}
