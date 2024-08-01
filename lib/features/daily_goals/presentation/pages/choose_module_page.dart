import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/daily_goals/presentation/pages/choose_skills_page.dart';
import 'package:tododyst/features/daily_goals/presentation/providers/choose_module_provider.dart';
import 'package:tododyst/router/router.dart';

import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class ChooseModulePage extends ConsumerWidget {
  const ChooseModulePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseModuleProvider);
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
                    _ChooseModule(),
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

class _ChooseModule extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseModuleProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              ref.read(chooseModuleProvider.notifier).changeIsModuleOpen();
            },
            child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                    bottomLeft: state.isModuleOpen
                        ? Radius.zero
                        : Radius.circular(20.r),
                    bottomRight: state.isModuleOpen
                        ? Radius.zero
                        : Radius.circular(20.r),
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
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
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
          ),
          if (state.modules.isEmpty)
            Visibility(
                visible: state.isModuleOpen,
                child: const _Module(
                    module: "These is no modules.", isLast: false))
          else
            Visibility(
              visible: state.isModuleOpen,
              child: Column(
                  children: List.generate(
                state.modules.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(chooseModuleProvider.notifier)
                          .changeSelectedModule(index);

                      context.router.push(
                        const ChooseSkillsRoute(),
                      );
                    },
                    child: _Module(
                      module: state.modules[index],
                      isLast: index == state.modules.length - 1,
                    ),
                  ),
                ),
              )),
            ),
        ],
      ),
    );
  }
}

class _Module extends ConsumerWidget {
  final String module;
  final bool isLast;

  const _Module({required this.module, required this.isLast});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chooseModuleProvider);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: lightBlue0,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isLast ? 20.r : 0),
          bottomRight: Radius.circular(isLast ? 20.r : 0),
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
