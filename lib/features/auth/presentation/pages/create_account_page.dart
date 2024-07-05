import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/custom_dialog.dart';
import 'package:tododyst/custom/custom_filled_button.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../custom/password_text_field.dart';
import '../providers/register_provider.dart';

@RoutePage()
class CreateAccountPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 37.w, right: 37.w, top: 100.h, bottom: 40.h),
        child: Form(
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
        const CustomTextField(
          hintText: "Your Name",
        ),
      ],
    );
  }
}

class _Surname extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const CustomTextField(
          hintText: "Your Surname",
        ),
      ],
    );
  }
}

class _EmailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const CustomTextField(
          hintText: "Your Email",
        ),
      ],
    );
  }
}

class _Password extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const PasswordTextField(
          hintText: "Your Password",
        ),
      ],
    );
  }
}

class _CheckPassword extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const PasswordTextField(
          hintText: "Check Your Password",
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
                    title: SingleChildScrollView(
                        child: const Text("Privacy Policy")),
                    content: Column(
                      children: [
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, eleifend nunc ...",
                        ),
                        CustomFilledButton(
                            onPressed: () {}, buttonText: "Close", color: blue),
                      ],
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
    final state = ref.watch(registerProvider);
    return CustomFilledButton(
      onPressed: () {},
      buttonText: "Confirm",
      color: blue,
    );
  }
}
