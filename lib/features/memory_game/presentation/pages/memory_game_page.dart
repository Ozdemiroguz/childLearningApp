import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/common/background_image.dart';

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
        opacity: 0.4,
        color: Colors.black,
        child: Center(
          child: state.isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GridView.builder(
                          itemCount: state.memoryGameModels.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.w,
                            crossAxisSpacing: 20.h,
                          ),
                          itemBuilder: (context, index) {
                            return FlipCard(
                                controller: state
                                    .memoryGameModels[index].flipCardController,
                                front: Container(
                                  color: Colors.red,
                                  child: Text("Front$index"),
                                ),
                                back: GestureDetector(
                                  onTap: () {},
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      color: Colors.blue,
                                      child: Text(
                                          "${state.memoryGameModels[index].url}"),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
