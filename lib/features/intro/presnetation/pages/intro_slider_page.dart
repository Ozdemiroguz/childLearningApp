// ignore: unnecessary_import
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/core/extensions/context_extensions.dart';
import 'package:tododyst/custom/custom_filled_button.dart';
import 'package:tododyst/features/intro/presnetation/providers/intro_provider.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../router/router.dart';
import '../widgets/indicator_widget.dart';

@RoutePage()
class IndroSliderPage extends StatefulHookConsumerWidget {
  const IndroSliderPage({super.key});

  @override
  _KidsAgePageState createState() => _KidsAgePageState();
}

class _KidsAgePageState extends ConsumerState<IndroSliderPage> {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 56.h,
        ),
        child: Column(
          children: [
            IndicatorWidget(
              counter: ref.watch(introProvider).counter + 1,
            ),
            Expanded(
              child: CarouselSlider(
                carouselController: carouselController,
                items: [
                  _Page1(),
                  _Page2(),
                  _Page3(),
                ],
                options: CarouselOptions(
                  height: context.screenHeight,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    ref.read(introProvider.notifier).changeCounter(index);
                    //print("index: $index");
                  },
                ),
              ),
            ),
            _NextButton(carouselController: carouselController),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  final CarouselSliderController carouselController;

  const _NextButton({required this.carouselController});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: CustomFilledButton(
        onPressed: () {
          if (ref.watch(introProvider).counter == 2) {
            context.router.push(const AnalysingResultRoute());
            return;
          }
          carouselController.nextPage();
        },
        child: const Text('Continue'),
      ),
    );
  }
}

class _Page1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      height: double.infinity,
      child: Column(
        children: [
          Text(
            "Preperation",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Assets.images.prep2.image(
            width: 190.w,
            height: 190.h,
          ),
          SizedBox(height: 20.h),
          Text(
            "Please select your kids age.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.center,
            "This choice will help us personalize your kids app experience.",
            style: TextStyle(fontSize: 16.sp, color: lightBlue1),
          ),
          SizedBox(height: 20.h),
          _AgeInput(),
        ],
      ),
    );
  }
}

class _AgeInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: lightGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Text(
            "Select your kids age",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 20.sp, color: lightBlue0),
          ),
          const Spacer(),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(introProvider.notifier).changeCounter(1);
                },
                child: Icon(
                  Icons.keyboard_arrow_up_sharp,
                  size: 32.r,
                  color: darkBlue1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(introProvider.notifier).changeCounter(1);
                },
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 32.r,
                  color: darkBlue1,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}

class _Page2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      height: double.infinity,
      width: context.screenWidth,
      child: Column(
        children: [
          Text(
            "Preperation",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Assets.images.prep3.image(
            width: 190.w,
            height: 190.h,
          ),
          Text(
            "Speaking Levels",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Please select your kids speaking levels.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: lightBlue1),
          ),
          SizedBox(height: 20.h),
          _SpeakingLevelInput(),
        ],
      ),
    );
  }
}

class _SpeakingLevelInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(introProvider);
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            ref.read(introProvider.notifier).changeLevels(index);
            //  print("index: $index");
          },
          child: Column(
            children: [
              if (index == 0) const Divider(color: darkGray),
              SizedBox(
                height: 64.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Lorem ıpsum dolor sit amet",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16.sp, color: darkGray),
                    ),
                    const Spacer(),
                    if (ref.watch(introProvider).levels[index])
                      Icon(
                        Icons.check_outlined,
                        color: darkGray,
                        size: 32.r,
                      ),
                  ],
                ),
              ),
              const Divider(
                color: darkGray,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Page3 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      height: double.infinity,
      width: context.screenWidth,
      child: Column(
        children: [
          Text(
            "Preperation",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Assets.images.prep4.image(
            width: 190.w,
            height: 190.h,
          ),
          Text(
            "Reading Levels",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Please select your kids the level of understanding and telling the story they are reading.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: lightBlue1),
          ),
          SizedBox(height: 20.h),
          _SpeakingLevelInput(),
        ],
      ),
    );
  }
}
