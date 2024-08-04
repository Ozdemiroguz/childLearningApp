import 'package:auto_route/auto_route.dart';
import 'package:crossword/crossword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/crossword/domain/models/crossword_game_type.dart';
import 'package:tododyst/gen/assets.gen.dart';
import 'package:tododyst/router/router.dart';
import 'package:tododyst/services/timer/otp_timer.dart';

import '../../../../constants/colors.dart';
import '../../domain/models/crossword.dart';
import '../providers/crossword_provider.dart';

GlobalKey<CrosswordState> crosswordState = GlobalKey<CrosswordState>();

@RoutePage()
class CrosswordPage extends StatefulHookConsumerWidget {
  final CrosswordGame crossword;

  const CrosswordPage({required this.crossword});

  @override
  _CrosswordPageState createState() => _CrosswordPageState();
}

class _CrosswordPageState extends ConsumerState<CrosswordPage> {
  String word = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crosswordProvider);

    return Scaffold(
      extendBody: true,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                //succes overlay

                Positioned.fill(
                  child: Image.asset(
                    widget.crossword.type.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 72.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: () {
                      context.router.replace(const ChaptersRoute());
                    },
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/Vector36.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        SizedBox(height: 60.h),
                        _Timer(),
                        SizedBox(height: 50.h),
                        _TypeAndLevel(
                          type: widget.crossword.type,
                          level: widget.crossword.level,
                        ),
                        SizedBox(height: 20.h),
                        _WordContainer(),
                        _GameBoard(),
                        SizedBox(height: 40.h),
                        _JokerButtons(),
                      ],
                    ),
                  ),
                ),
                if (state.sectionCompleted)
                  Positioned.fill(
                    child: ColoredBox(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Congratulations!",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 40.sp,
                                    fontFamily: "Righteous",
                                    color: white,
                                  ),
                            ),
                            SizedBox(height: 20.h),
                            GestureDetector(
                              onTap: () {
                                context.router.replace(const ChaptersRoute());
                              },
                              child: Container(
                                width: 44.w,
                                height: 44.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/Vector36.png',
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

class _Timer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "0:${state.time + 35}",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 37.sp,
                color: black,
                fontFamily: "Righteous",
              ),
        ),
        SizedBox(width: 10.w),
        Assets.images.timer.image(),
      ],
    );
  }
}

class _TypeAndLevel extends StatelessWidget {
  final CrosswordGameType type;
  final int level;

  const _TypeAndLevel({
    required this.type,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.name,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 45.sp,
                fontFamily: "Righteous",
                color: black,
              ),
        ),
        Text(
          "level-$level",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                color: black,
                fontFamily: "Righteous",
              ),
        ),
      ],
    );
  }
}

class _WordContainer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(crosswordProvider);
    final List<String> words = state.wordData.words;

    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.w),
      ),
      width: double.infinity,
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 3.w,
              ),
              itemCount: words.length,
              itemBuilder: (context, index) {
                return Text(
                  textAlign: TextAlign.center,
                  words[index],
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: black,
                        decorationThickness: 2,
                        fontFamily: "Righteous",
                        fontSize: 18.sp,
                        decoration: state.wordsToFind.contains(words[index])
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GameBoard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(crosswordProvider);
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: state.wordData.board.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Crossword(
              drawVerticalLine: true,
              drawHorizontalLine: true,
              drawCrossLine: true,
              acceptReversedDirection: true,
              allowOverlap: true,
              //updateStateWithParent: true,
              revealLetterDecoration:
                  const RevealLetterDecoration(shakeOffset: Offset(20, 50)),

              key: crosswordState,
              letters: state.wordData.board,
              spacing: const Offset(50, 50),

              onLineUpdate: (word, p1, p2) {
                ref.read(crosswordProvider.notifier).onChangedWordsToFind(p1);
              },

              // onLineUpdate: (String word) {
              //   setState(() {
              //     this.word = word;
              //   });
              // },
              textStyle: const TextStyle(
                color: black,
                fontSize: 36,
                fontFamily: "Righteous",
              ),

              lineDecoration: LineDecoration(
                lineGradientColors: [
                  [crosswordColors[state.wordsToFind.length]],
                ],
                incorrectGradientColors: [Colors.pink],
                strokeWidth: 46,
                lineTextStyle: const TextStyle(
                  color: black,
                  fontSize: 36,
                  fontFamily: "Righteous",
                ),
              ),
              addIncorrectWord: false,
              hints: state.wordData.words,
            ),
    );
  }
}

class _JokerButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _JokerButton(
          image: Assets.images.bomb,
          isPressed: false,
          onPressed: () {},
        ),
        _JokerButton(
          image: Assets.images.video,
          isPressed: false,
          onPressed: () {},
        ),
        _JokerButton(
          image: Assets.images.hintPng,
          isPressed: false,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _JokerButton extends ConsumerWidget {
  final AssetGenImage image;
  final bool isPressed;
  final Function() onPressed;

  const _JokerButton({
    required this.image,
    required this.isPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(11.r),
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey : Colors.white,
          shape: BoxShape.circle,
        ),
        child: image.image(),
      ),
    );
  }
}
