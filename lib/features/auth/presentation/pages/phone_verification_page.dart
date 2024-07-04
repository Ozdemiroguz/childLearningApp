import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/custom/custom_filled_button.dart';

import '../../../../router/router.dart';
import '../providers/register_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class PhoneVerificationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.r),
        child: Center(
          child: Form(
            key: ref.watch(_keyProvider),
            child: Column(
              children: [
                SizedBox(height: 194.h),
                Text(
                  'Verification ',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 46.sp,
                        color: darBlue2,
                      ),
                ),
                SizedBox(height: 16.h),
                Text(
                  textAlign: TextAlign.center,
                  'Enter the verification code,we sent to your phone number',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 18.sp,
                        color: darkGray1,
                        fontFamily: "Popins",
                      ),
                ),
                _ChangeNumber(),
                SizedBox(height: 36.h),
                _Pinput(),
                SizedBox(height: 128.h),
                _ConfirmButton(),
                SizedBox(height: 14.h),
                _ResendCode(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChangeNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.replaceAll([PhoneInputRoute()]);
      },
      child: Text(
        'Change Number',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 18.sp,
            fontFamily: "",
            color: blue,
            decoration: TextDecoration.underline,
            decorationColor: blue),
      ),
    );
  }
}

class _Pinput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return Pinput(
      errorBuilder: (errorText, pin) => Text(
        textAlign: TextAlign.center,
        errorText!,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 14.sp,
              color: blue,
            ),
      ),
      errorText:
          ref.watch(registerProvider).pinputFailure.toNullable()?.message,
      errorTextStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: 14.sp,
            color: red,
          ),
      onCompleted: (value) => notifier.onChangedPassword(value),
      onChanged: (value) => notifier.onChangedPinput(value),
      onSubmitted: (value) => notifier.onChangedPinput(value),
      validator: (value) =>
          ref.read(registerProvider).pinputFailure.toNullable()?.message,

      // errorPinTheme: PinTheme(
      //   textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
      //       fontWeight: FontWeight.w600,
      //       fontSize: 22.sp,
      //       color: darkGray1,
      //       fontFamily: "Popins"),
      //   width: 50.w,
      //   height: 50.h,
      //   decoration: BoxDecoration(
      //     color: lightBlue0,
      //     borderRadius: BorderRadius.circular(50.r),
      //   ),
      // ),
      defaultPinTheme: PinTheme(
        textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            color: darkGray1,
            fontFamily: "Popins"),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: lightBlue0,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () {
        final formState = ref.watch(_keyProvider).currentState;
        formState!.validate();

        if (formState.validate()) {
          print('Validated');
          formState.save();
          context.router.replace(UserTypeRoute());
        }
      },
      buttonText: 'Confirm',
      color: blue,
    );
  }
}

class _ResendCode extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Send Code Again',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 18.sp,
              color: darkGray1,
            ),
      ),
    );
  }
}
