import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/constans.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/router/router.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class RegisterPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => context.router.maybePop(),
              child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Assets.icons.arrowLeft.svg(),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              "Şifre Oluştur",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        onBackPressed: () => context.router.maybePop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 46.h,
              ),
              PasswordPinInputPart(),
              SizedBox(
                height: 112.h,
              ),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordPinInputPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Şifre Oluştur",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(
            height: 40.h,
          ),
          PasswordPinInput(),
          SizedBox(
            height: 40.h,
          ),
          Container(
            padding: EdgeInsets.all(
              16.r,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF3F4F8),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                3,
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " • ",
                    ),
                    Expanded(
                      child: Text(
                        style: Theme.of(context).textTheme.bodySmall,
                        passwordRules[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordPinInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Expanded(
          child: CustomTextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ],
    );
  }
}

class RegisterButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: CustomFilledButton(
        onPressed: () {
          context.router.replace(const HomeRoute());
        },
        child: const Text("Kayıt Ol"),
      ),
    );
  }
}
