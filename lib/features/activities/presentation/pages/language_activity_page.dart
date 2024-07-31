import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/extensions/context_extensions.dart';
import 'package:tododyst/custom/custom_filled_button.dart';
import 'package:tododyst/features/activities/presentation/providers/language_provider.dart';
import 'package:tododyst/router/router.dart';

import '../../../../constants/colors.dart';

import '../widgets/question_bar.dart';

@RoutePage()
class LanguageActivityPage extends ConsumerWidget {
  final int level;

  const LanguageActivityPage({required this.level});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageProvider);
    return Scaffold(
      body: Center(
        child: ref.watch(languageProvider).isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  SizedBox(height: 90.h),
                  SizedBox(
                    width: context.screenWidth,
                    child: QuestionBar(
                      decimalValue: state.answers.isEmpty
                          ? 0
                          : ((state.currentQuestion / state.answers.length) *
                                  100)
                              .toInt(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Language Skills - Activities",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 22.sp,
                        ),
                  ),
                  SizedBox(height: 50.h),
                  _QuestionPart(),
                  SizedBox(height: 50.h),
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
  //1 ile 5 arasında rastgele bir sayı üretir

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageProvider);
    final int random = state.random;
    final String question = state.answers.isEmpty
        ? "Loading..."
        : state.answers[state.currentQuestion];

    return //switch case ile random sayıya göre farklı sorular üretilir
        random == 1
            ? RotatedBox(
                quarterTurns: 1,
                child: Text(question, style: const TextStyle(fontSize: 44)),
              )
            : random == 2
                ? RotatedBox(
                    quarterTurns: 2,
                    child: Text(question, style: const TextStyle(fontSize: 44)),
                  )
                : random == 3
                    ? RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          question,
                          style: TextStyle(
                            fontSize: 44.sp,
                          ),
                        ),
                      )
                    : Text(
                        question,
                        style: TextStyle(
                          fontSize: 44.sp,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2.85,
                          decorationColor: darkBlue1,
                        ),
                      );
  }
}

class _Options extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(languageProvider);
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
    final state = ref.watch(languageProvider);
    final notifier = ref.watch(languageProvider.notifier);
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
    final state = ref.watch(languageProvider);
    return Visibility(
      visible: state.selectedOption != null,
      child: SizedBox(
        width: 305.w,
        height: 45.h,
        child: CustomFilledButton(
          color: state.color,
          onPressed: () {
            if (!state.isAnswered && !state.isCorrect) {
              ref.read(languageProvider.notifier).checkAnswer();
            } else if (state.isAnswered && !state.isCorrect) {
              ref.read(languageProvider.notifier).wrongAnswer();
            } else {
              if (state.currentQuestion < state.answers.length - 1) {
                ref.read(languageProvider.notifier).nextQuestion();
              } else {
                context.router.replace(
                  ActivitesLevelRoute(
                    activityName: "Language Skills - Activities",
                  ),
                );
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
      ),
    );
  }
}
