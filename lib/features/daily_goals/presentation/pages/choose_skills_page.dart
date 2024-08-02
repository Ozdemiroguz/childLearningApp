import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/custom_filled_button.dart';
import 'package:tododyst/features/daily_goals/presentation/providers/choose_module_provider.dart';
import 'package:tododyst/features/daily_goals/presentation/providers/choose_skills_provider.dart';
import 'package:tododyst/router/router.dart';

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
                    _ChooseSkills(),
                    SizedBox(height: 20.h),
                    _NextButton(),
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
                  const Spacer(),
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    ref.read(chooseModuleProvider).selectedModule,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: white,
                        ),
                  ),
                  const Spacer(),
                  Assets.icons.arrowDown.svg(
                    color: white,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),),
          if (state.skills.isEmpty)
            const _Module(
              index: -1,
            )
          else
            SizedBox(height: 21.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "Please select ${ref.read(chooseModuleProvider).selectedModule} skills",
                style: Theme.of(context).textTheme.displaySmall,),
          ),
          SizedBox(height: 13.h),
          Column(
              children: List.generate(
            state.skills.length,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h),
              child: GestureDetector(
                onTap: () {},
                child: _Module(
                  index: index,
                ),
              ),
            ),
          ),),
        ],
      ),
    );
  }
}

class _Module extends ConsumerWidget {
  final int index;

  const _Module({
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseSkillsProvider);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 20.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: state.selectedError ? red : lightBlue0,
          width: 2.w,
        ),
        color: lightBlue0,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          Text(
              textAlign: TextAlign.center,
              index == -1 ? "No skills found" : state.skills[index],
              style: Theme.of(context).textTheme.displaySmall,),
          const Spacer(),
          Checkbox(
            checkColor: darkBlue1,
            activeColor: darkBlue1,
            value: state.selectedSkillIndexes.contains(index),
            onChanged: (value) {
              if (value != null) {
                ref
                    .read(chooseSkillsProvider.notifier)
                    .changeSelectedSkill(index);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseSkillsProvider);
    return SizedBox(
        width: 200.w,
        child: CustomFilledButton(
            onPressed: () {
              if (state.selectedSkillIndexes.isEmpty) {
                ref.read(chooseSkillsProvider.notifier).selectedError();
              } else {
                context.router.push(const ChoseTimeRoute());
              }
            },
            buttonText: "Next",),);
  }
}
