import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/activities/presentation/widgets/question_bar.dart';
import 'package:tododyst/gen/assets.gen.dart';

@RoutePage()
class DailyGoalsPage extends ConsumerWidget {
  const DailyGoalsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            _Title(),
            SizedBox(height: 20.h),
            _SkillPart(),
            SizedBox(height: 20.h),
            _SkillPart(),
            SizedBox(height: 20.h),
            _SkillPart(),
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
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        "Daily Goals",
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}

class _SkillPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 20.w,
            top: 20.h,
            bottom: 12.h,
          ),
          decoration: BoxDecoration(
            color: const Color(0xfff1f1f1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 177.h,
          child: Column(
            children: [
              SizedBox(
                height: 120.h,
                child: Row(
                  children: [
                    Assets.images.careskill.image(),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Self-Care Skills",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 20.sp,
                              ),
                        ),
                        const Spacer(),
                        Text("5 tasks",
                            style: Theme.of(context).textTheme.displaySmall,),
                        Text("%75",
                            style: Theme.of(context).textTheme.displaySmall,),
                        SizedBox(height: 10.h),
                      ],
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
              const QuestionBar(decimalValue: 50, isAppBar: false),
            ],
          ),
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
            ),
            itemBuilder: (BuildContext context, int index) => Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),),
      ],
    );
  }
}
