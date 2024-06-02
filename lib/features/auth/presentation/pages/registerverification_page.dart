import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../router/router.dart';

@RoutePage()
class RegisterVerificationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 58.h,
              ),
              InfoPart(),
              SizedBox(
                height: 39.h,
              ),
              PinCode(),
              SizedBox(
                height: 45.h,
              ),
              Timer(),
              SizedBox(
                height: 56.h,
              ),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Numaranı Kod ile Doğrula",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 47.h,
        ),
        Text(
          "Sms kodunu aşşağıdaki numaraya gönderdik.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 45.h,
        ),
        Text(
          "+90 (555) 555 55 55",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        GestureDetector(
          onTap: () {
            context.router.replaceAll([const RegisterPhoneRoute()]);
          },
          child: Text(
            "Numarayı Değiştir",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orange,
                  decorationThickness: 1,
                ),
          ),
        ),
      ],
    );
  }
}

class PinCode extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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
          width: 32.w,
        ),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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
          width: 32.w,
        ),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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
          width: 32.w,
        ),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
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

class Timer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "Yeni kod almak için kalan Süre ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primary700,
                ),
            children: [
              TextSpan(
                text: "59",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.orange,
                    ),
              ),
              TextSpan(
                text: " saniye",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.primary700,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        SizedBox(
          height: 24.h,
          child: Visibility(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Kod Gönder",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.orange,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.orange,
                      decorationThickness: 1,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// pin code

// devam et butonu
class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity,
      child: CustomFilledButton(
        child: const Text("Devam Et"),
        onPressed: () {
          context.router.replace(const RegisterInfoRoute());
        },
      ),
    );
  }
}
