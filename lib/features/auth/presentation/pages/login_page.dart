import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/password_text_field.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_dialog.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../router/router.dart';
import '../providers/login_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
//statefull widget
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 185.h,
            bottom: 40.h,
          ),
          child: Form(
            key: ref.watch(_keyProvider),
            child: Column(
              children: [
                Logo(),
                SizedBox(height: 70.h),
                _UserNamePhoneMail(),
                SizedBox(
                  height: 18.h,
                ),
                _Password(),
                SizedBox(
                  height: 42.h,
                ),
                _LoginButton(),
                SizedBox(
                  height: 42.h,
                ),
                _RegisterDirection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Sign In",
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: darBlue2,
            fontSize: 46.sp,
          ),
    );
  }
}

class _UserNamePhoneMail extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "UserName",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        CustomTextField(
          hintText: "Your Username",
          onChanged: notifier.onChangedEmail,
          onSaved: notifier.onChangedEmail,
          onFieldSubmitted: notifier.onChangedEmail,
          validator: (value) =>
              ref.read(loginProvider).emailFailure.toNullable()?.message,
        ),
      ],
    );
  }
}

class _Password extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "Password",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        PasswordTextField(
          onChanged: notifier.onChangedPassword,
          onSaved: notifier.onChangedPassword,
          onFieldSubmitted: notifier.onChangedPassword,
        ),
      ],
    );
  }
}

class _ForgotPassword extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Şifreni mi unuttun?",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
        ),
      ),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: CustomFilledButton(
        color: blue,
        onPressed: () {
          final formState = ref.read(_keyProvider).currentState;
          formState?.validate();

          if (formState != null && formState.validate()) {
            print('Validated');
            ref.watch(loginProvider.notifier).login();

            ref.read(loginProvider).failure.fold(
                  () => context.router.replace(const HomeRoute()),
                  (t) => CustomDialog.failure(
                    title: 'Hata',
                    subtitle: t.message,
                  ).show(context),
                );
          }
        },
        child: const Text("Confirm"),
      ),
    );
  }
}

class _RegisterDirection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: "Rubik",
                color: black,
                fontWeight: FontWeight.w500,
              ),
        ),
        GestureDetector(
          onTap: () {
            context.router.replaceAll([const PhoneInputRoute()]);
          },
          child: Text(
            "Register here",
            //altı çizili

            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  decorationColor: blue2,
                  fontFamily: "Rubik",
                  color: blue2,
                ),
          ),
        ),
      ],
    );
  }
}
