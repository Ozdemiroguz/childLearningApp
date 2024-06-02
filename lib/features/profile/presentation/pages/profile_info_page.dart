import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/custom/password_text_field.dart';
import 'package:rota/utils/input_formatters.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../test/testprovider.dart';

//global form key
final _formKey = GlobalKey<FormState>();

@RoutePage()
class ProfileInfoPage extends ConsumerWidget {
  const ProfileInfoPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: "Bilgilerim",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            _MyInfoForm(),
            SizedBox(
              height: 43.h,
            ),
            _EditButton(),
          ],
        ),
      ),
    );
  }
}

class _MyInfoForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _NameSurnamePart(),
          SizedBox(
            height: 12.h,
          ),
          _IdentityNumberPart(),
          SizedBox(
            height: 12.h,
          ),
          _BirthDatePart(),
          SizedBox(
            height: 12.h,
          ),
          _Email(),
          SizedBox(
            height: 12.h,
          ),
          _Password(),
        ],
      ),
    );
  }
}

class _NameSurnamePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Ad Soyad",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary800),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(
          validator: (value) => value!.isEmpty ? "Ad Soyad Giriniz" : null,
          initialValue: "Elif Öztürk",
          hintText: "Ad Soyad",
        ),
      ],
    );
  }
}

class _IdentityNumberPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "TC Kimlik Numarası",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary800),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(
          validator: (value) =>
              value!.isEmpty ? "TC Kimlik Numarası Giriniz" : null,
          initialValue: "1888**",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          hintText: "TC Kimlik Numarası",
        ),
      ],
    );
  }
}

class _BirthDatePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Doğum Tarihi",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary800),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(
          initialValue: "15.09.2001",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(8),
          ],
          validator: (value) => value!.isEmpty ? "Doğum Tarihi Giriniz" : null,
          textInputType: TextInputType.datetime,
          hintText: "Doğum Tarihi",
        ),
      ],
    );
  }
}

class _Email extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "E-posta",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary800),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(
          validator: (value) => value!.isEmpty ? "E-posta Giriniz" : null,
          inputFormatters: [],
          initialValue: "elifoztrtrk@gmail.com",
          hintText: "E-posta",
        ),
      ],
    );
  }
}

class _Password extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Şifre",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary800),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        PasswordTextField(
          validator: (value) => value!.isEmpty ? "Şifre Giriniz" : null,
          hintText: "Şifre",
        ),
      ],
    );
  }
}

class _EditButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool saved = ref.watch(testProvider).testbool3;
    ref.watch(testProvider);
    return CustomFilledButton(
      borderColor: AppColors.orange,
      color: saved ? Colors.transparent : AppColors.orange,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ref.watch(testProvider.notifier).onChangedTestBool3(!saved);
          print(ref.read(testProvider).testbool3);
        }
      },
      child: Text(
        "Düzenlemeyi Kaydet",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: !saved ? white : AppColors.orange,
            ),
      ),
    );
  }
}
