import 'package:auto_route/auto_route.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/common/background_image.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/memory_game/presentation/widgets/top_title.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../provider/memory_game_provider.dart';

@RoutePage()
class MemoryGamePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //random sayı üret

    final state = ref.watch(memoryGameProvider);
    return Scaffold(
      body: BackgroundImage(
        imagePath: "assets/images/memoryback.png",
        opacity: state.correctIndexes.length == state.memoryGameModels.length
            ? 0.8
            : 0,
        color: state.correctIndexes.length == state.memoryGameModels.length
            ? black
            : Colors.transparent,
        child: state.isLoading
            ? Center(
                child: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: const CircularProgressIndicator()))
            : state.correctIndexes.length == state.memoryGameModels.length
                ? _EndGame()
                : Column(
                    children: [
                      SizedBox(
                        height: 150.h - state.level * 2,
                      ),
                      TopTitle(
                          title: "LEVEL - ${state.level}",
                          onTap: () {
                            context.router.maybePop();
                          }),
                      const _GamePart(),
                    ],
                  ),
      ),
    );
  }
}

class _GamePart extends ConsumerWidget {
  const _GamePart();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memoryGameProvider);
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: state.horizontalCount == 2
              ? 100.w
              : state.horizontalCount == 3
                  ? 75.w
                  : state.horizontalCount == 4
                      ? 50.w
                      : 25.w,
        ),
        itemCount: state.memoryGameModels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: state.horizontalCount,
          mainAxisSpacing: 5.w,
          crossAxisSpacing: 5.h,
        ),
        itemBuilder: (context, index) {
          return Visibility(
            visible: !state.correctIndexes.contains(index),
            child: FlipCard(
                flipOnTouch: false,
                controller: state.memoryGameModels[index].flipCardController,
                front: Center(
                  child: GestureDetector(
                    onTap: () async {
                      await ref
                          .read(memoryGameProvider.notifier)
                          .chooseCard(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: white, width: 2),
                        color: lightBrown,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "?",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: Colors.white,
                                fontFamily: "SedgwickAveDisplay",
                                fontSize: state.horizontalCount == 2
                                    ? 90.sp
                                    : state.horizontalCount == 3
                                        ? 80.sp
                                        : state.horizontalCount == 4
                                            ? 70.sp
                                            : state.horizontalCount == 5
                                                ? 60.sp
                                                : 50.sp,
                                height: 1.1,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                back: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: white, width: 2),
                    color: lightBrown.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("${state.memoryGameModels[index].url}",
                        style: TextStyle(
                          color: white,
                          fontSize: 16.sp,
                          height: 1.1,
                        )),
                  ),
                )),
          );
        });
  }
}

class _EndGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75.h,
        ),
        TopTitle(title: "", onTap: () => context.router.maybePop()),
        SizedBox(
          height: 75.h,
        ),
        Container(
          child: Assets.images.circularcheckmemory.image(
            width: 174.w,
            height: 174.h,
          ),
        ),
        Text(
          "Well Done",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: white,
                fontSize: 70.sp,
                fontFamily: "Righteous",
              ),
        ),
      ],
    );
  }
}
