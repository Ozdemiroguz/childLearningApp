import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/crossword/domain/models/crossword_game_type.dart';
import 'package:tododyst/gen/assets.gen.dart';
import 'package:tododyst/router/router.dart';

import '../../../../constants/colors.dart';
import '../../domain/models/crossword.dart';

final sectionIdProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class ChaptersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Assets.images.croswordchapback.image(
                fit: BoxFit.cover,
              ),
            ),
            //blur
            Positioned.fill(
              child: Container(
                color: darkGray2.withOpacity(0.5),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      "Chapters",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 40.sp,
                            fontFamily: "Righteous",
                            color: white,
                          ),
                    ),
                    SizedBox(height: 20.h),
                    _Chapters(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chapters extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 23.w,
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ref.read(sectionIdProvider.notifier).state = index + 1;
              context.router.replace(
                CrosswordRoute(
                  crossword: CrosswordGame(
                    // ignore: use_is_even_rather_than_modulo
                    type: index % 2 == 0
                        ? CrosswordGameType.animals
                        : CrosswordGameType.colors,
                    level: index + 1,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(
                        // ignore: use_is_even_rather_than_modulo
                        index % 2 == 0
                            ? "assets/images/animals.png"
                            : "assets/images/colors.png",
                      ).image,
                    ),
                    border: Border.all(color: white, width: 4),
                    borderRadius: BorderRadius.circular(25.r),
                    color: turquoise,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  width: 132.w,
                  height: 132.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Chapter ${index + 1}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: white,
                        fontSize: 23.sp,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
