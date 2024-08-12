import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/memory_game_provider.dart';

@RoutePage()
class MemoryGamePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //random sayı üret

    int randomValue = Random().nextInt(9);

    if (randomValue < 4) {
      randomValue = 4;
    }
    if (randomValue % 2 != 0) {
      randomValue++;
    }
    print(randomValue);
    List<FlipCardController> flipCardControllers =
        List.generate(randomValue, (index) => FlipCardController());
    final state = ref.watch(memoryGameProvider);
    return Scaffold(
      body: Center(
        child: state.isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                        itemCount: randomValue,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.w,
                          crossAxisSpacing: 20.h,
                        ),
                        itemBuilder: (context, index) {
                          return FlipCard(
                              controller: flipCardControllers[index],
                              front: Container(
                                color: Colors.red,
                                child: Text("Front$index"),
                              ),
                              back: Container(
                                color: Colors.blue,
                                child: Text("Back$index"),
                              ));
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
