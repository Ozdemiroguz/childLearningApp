import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/custom/custom_text_field.dart';

import '../../../../custom/custom_app_bar.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class AddNewCardPage extends ConsumerWidget {
  const AddNewCardPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: 'Yeni Kart Ekle',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            _InputsPart(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}

class _InputsPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _CardName(),
        SizedBox(
          height: 8.h,
        ),
        _CardNameSurname(),
        SizedBox(
          height: 8.h,
        ),
        _CardNumber(),
        SizedBox(
          height: 8.h,
        ),
        _CardExpireDate(),
        SizedBox(
          height: 8.h,
        ),
        _CardCvv(),
        SizedBox(
          height: 24.h,
        ),
        _AddCardButton(),
      ],
    );
  }
}

class _CardName extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: 'Karta İsim Ver',
      onChanged: (value) {},
    );
  }
}

class _CardNameSurname extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: 'Kart Üzerindeki İsim Soyisim',
      onChanged: (value) {},
    );
  }
}

class _CardNumber extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h),
          child: Assets.icons.creditCard.svg(width: 24.w, height: 24.h)),
      hintText: 'Kart Numarası',
      onChanged: (value) {},
    );
  }
}

class _CardExpireDate extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: 'Son Kullanma Tarihi',
      onChanged: (value) {},
    );
  }
}

class _CardCvv extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: 'CVV',
      onChanged: (value) {},
    );
  }
}

class _AddCardButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(children: [
            Assets.icons.security.svg(width: 24.w, height: 24.h),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                "Kart Bilgileriniz PCI-DSS kapsamına uyumlu şekilde saklanacaktır.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomFilledButton(
          onPressed: () {},
          buttonText: 'Kart Ekle',
        ),
      ],
    );
  }
}
