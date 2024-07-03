import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/custom/custom_app_bar.dart';
import 'package:tododyst/custom/custom_dropdown_button_formfield.dart';

import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';

@RoutePage()
class RegisterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.r),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 158.h),
              Text(
                textAlign: TextAlign.center,
                'Welcome to ToDoDys',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 46.sp,
                    ),
              ),
              SizedBox(height: 20.h),
              _PhoneInput(),
              SizedBox(height: 20.h),
              _GetCodeButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: darkGray1,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
      hintText: 'Phone Number',
      initialValue: "+90",
    );
  }
}

class _GetCodeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      onPressed: () {},
      buttonText: 'Get Code',
      color: blue,
    );
  }
}
