import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/custom_dialog.dart';
import 'package:tododyst/custom/custom_filled_button.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../custom/password_text_field.dart';
import '../../../../router/router.dart';
import '../providers/register_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class CreateAccountPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerProvider.select((value) => value.isLoading),
        (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide(context: context);
      }
    });

    ref.watch(registerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 37.w, right: 37.w, top: 100.h, bottom: 40.h),
        child: Form(
          key: ref.watch(_keyProvider),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: darkGray1,
                        fontWeight: FontWeight.w500,
                        fontSize: 46.sp,
                      ),
                ),
                SizedBox(height: 50.h),
                _NameInput(),
                SizedBox(height: 15.h),
                _Surname(),
                SizedBox(height: 15.h),
                _EmailInput(),
                SizedBox(height: 15.h),
                _Password(),
                SizedBox(height: 15.h),
                _CheckPassword(),
                SizedBox(height: 15.h),
                _PrivacyPolicy(),
                SizedBox(height: 20.h),
                ConfirmButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "Name",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        CustomTextField(
          onChanged: notifier.onChangedFirstName,
          onFieldSubmitted: notifier.onChangedFirstName,
          onSaved: (value) => notifier.onChangedFirstName(value!),
          validator: (value) => value!.isEmpty ? "Name can't be empty" : null,
          hintText: "Your Name",
        ),
      ],
    );
  }
}

class _Surname extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "Surname",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        CustomTextField(
          hintText: "Your Surname",
          onChanged: notifier.onChangedLastName,
          onFieldSubmitted: notifier.onChangedLastName,
          onSaved: (value) => notifier.onChangedLastName(value!),
          validator: (value) =>
              value!.isEmpty ? "Surname can't be empty" : null,
        ),
      ],
    );
  }
}

class _EmailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "Email",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        CustomTextField(
          initialValue: "",
          hintText: "Your Email",
          onChanged: notifier.onChangedEmail,
          onFieldSubmitted: notifier.onChangedEmail,
          onSaved: (value) => notifier.onChangedEmail(value!),
          validator: (value) =>
              ref.read(registerProvider).emailFailure.toNullable()?.message,
        ),
      ],
    );
  }
}

class _Password extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);

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
          hintText: "Your Password",
          onChanged: notifier.onChangedPassword,
          onFieldSubmitted: notifier.onChangedPassword,
          onSaved: (value) => notifier.onChangedPassword(value!),
          validator: (value) =>
              ref.read(registerProvider).passwordFailure.toNullable()?.message,
        ),
      ],
    );
  }
}

class _CheckPassword extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 8.h),
          child: Text(
            "Check Password",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darBlue2,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        PasswordTextField(
          hintText: "Check Your Password",
          onChanged: notifier.onChangedConfirmPassword,
          onFieldSubmitted: notifier.onChangedConfirmPassword,
          onSaved: (value) => notifier.onChangedConfirmPassword(value!),
          validator: (value) => ref
              .read(registerProvider)
              .confirmPasswordFailure
              .toNullable()
              ?.message,
        ),
      ],
    );
  }
}

class _PrivacyPolicy extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Checkbox(
          checkColor: darkBlue1,
          fillColor: WidgetStateProperty.all(lightBlue0),
          value: true,
          onChanged: (value) {},
        ),
        Text(
          "I agree to all terms, rules and ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: darkGray1,
                fontSize: 11.sp,
                fontFamily: "Poppins",
              ),
        ),
        TextButton(
          onPressed: () {
            showAdaptiveDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return Center(
                  child: AlertDialog(
                    title: const Text("Privacy Policy"),
                    content: SizedBox(
                      width: 300.w,
                      height: 500.h,
                      child: Scrollbar(
                        thickness: 5.w,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 450.h,
                                child: const Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, eleifend nunc ...",
                                ),
                              ),
                              CustomFilledButton(
                                onPressed: () {},
                                buttonText: "Confirm",
                                color: blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: blue,
                  fontSize: 11.sp,
                  fontFamily: "Poppins",
                ),
          ),
        ),
      ],
    );
  }
}

class ConfirmButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    final notifier = ref.watch(registerProvider.notifier);

    return CustomFilledButton(
      onPressed: () async {
        final formState = ref.read(_keyProvider).currentState;

        formState?.validate();

        if (formState != null && formState.validate()) {
          await notifier.register();

          ref.read(registerProvider).failure.fold(
                () => context.router.replace(const LoginRoute()),
                (t) => CustomDialog.failure(
                  title: 'Hata',
                  subtitle: t.message,
                ).show(context),
              );
        }
      },
      buttonText: "Confirm",
      color: blue,
    );
  }
}
