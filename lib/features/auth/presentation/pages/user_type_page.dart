import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/core/models/user_models/user_type.dart';
import 'package:tododyst/custom/custom_filled_button.dart';
import 'package:tododyst/features/auth/presentation/pages/create_account_page.dart';

import '../../../../constants/colors.dart';
import '../../../../router/router.dart';
import '../providers/register_provider.dart';

@RoutePage()
class UserTypePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Select login type",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: darkGray1,
                      fontWeight: FontWeight.w500,
                      fontSize: 46.sp,
                    ),
              ),
              SizedBox(height: 50.h),
              const _UserTypeSelectionBox(
                userType: UserType.parent,
              ),
              SizedBox(height: 15.h),
              const _UserTypeSelectionBox(
                userType: UserType.student,
              ),
              SizedBox(height: 15.h),
              const _UserTypeSelectionBox(
                userType: UserType.teacher,
              ),
              SizedBox(height: 50.h),
              _NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserTypeSelectionBox extends ConsumerWidget {
  final UserType userType;

  const _UserTypeSelectionBox({required this.userType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return GestureDetector(
      onTap: () {
        ref.read(registerProvider.notifier).onChangedType(userType);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: lightBlue0,
          borderRadius: BorderRadius.circular(8.r),
        ),
        width: double.infinity,
        height: 47.h,
        child: Row(
          children: [
            Text(
              userType.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: darkGray1,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
            ),
            const Spacer(),
            _Checkbox(
              userType: userType,
            ),
          ],
        ),
      ),
    );
  }
}

class _Checkbox extends ConsumerWidget {
  final UserType userType;

  const _Checkbox({required this.userType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerProvider);
    return Container(
        padding: EdgeInsets.all(2.w),
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
            border: Border.all(
              color: darkGray1,
              width: 2.w,
            ),
            shape: BoxShape.circle),
        child: Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: state.userType == userType ? darkGray1 : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ));
  }
}

class _NextButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerProvider);
    return CustomFilledButton(
      color: blue,
      buttonText: "Next",
      onPressed: () {
        context.router.push(const CreateAccountRoute());
      },
    );
  }
}
