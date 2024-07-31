import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/daily_goals/presentation/providers/choose_skills_provider.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class ChooseSkillsPage extends ConsumerWidget {
  const ChooseSkillsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseSkillsProvider);
    return Scaffold(
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state.failure.fold(
              () => Center(
                child: Column(
                  children: [
                    SizedBox(height: 90.h),
                  ],
                ),
              ),
              (a) => Center(
                child: Text(a.toString()),
              ),
            ),
    );
  }
}

class _ChooseSkills extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseSkillsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        children: [
          Container(
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
              child: Row(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Choose Module",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: white,
                        ),
                  ),
                  Spacer(),
                  Assets.icons.arrowDown.svg(
                    color: white,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              )),
          if (state.skillss.isEmpty)
            const _Module(
              module: "These is no modules.",
            )
          else
            Column(
                children: List.generate(
              state.skillss.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: GestureDetector(
                  onTap: () {
                    print("Module: ${state.skillss[index]}");
                  },
                  child: _Module(
                    module: state.skillss[index],
                  ),
                ),
              ),
            )),
        ],
      ),
    );
  }
}

class _Module extends ConsumerWidget {
  final String module;

  const _Module({
    required this.module,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseSkillsProvider);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: lightBlue0,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Text(
        textAlign: TextAlign.center,
        module,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: darkBlue1,
            ),
      ),
    );
  }
}
