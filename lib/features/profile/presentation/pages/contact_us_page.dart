import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_dropdown_button_formfield.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/custom/custom_text_field.dart';

import '../../../../custom/custom_app_bar.dart';

@RoutePage()
class ContactUsPage extends ConsumerWidget {
  const ContactUsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: "Bize Ulaşın",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            _SubjectDropDown(),
            SizedBox(
              height: 12.h,
            ),
            _ComplaintTextField(),
            SizedBox(
              height: 12.h,
            ),
            _SendButton(),
          ],
        ),
      ),
    );
  }
}

class _SubjectDropDown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDropdownButtonFormField(
        onChanged: (value) => print(value),
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: gray,
            ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        hintText: "KonuSeç",
        color: gray,
        items: const [
          DropdownMenuItem(
            child: Text("KonuSeç"),
            value: "initial",
          ),
          DropdownMenuItem(
            child: Text("Öneri"),
            value: "Öneri",
          ),
          DropdownMenuItem(
            child: Text("Şikayet"),
            value: "Şikayet",
          ),
          DropdownMenuItem(
            child: Text("Yardım"),
            value: "Yardım",
          ),
        ]);
  }
}

class _ComplaintTextField extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText:
              "Uygulama ile ilgili tüm soru, öneri, şikayet ya da memnuniyetinizi bize ilet.",
          maxLines: 10,
          onChanged: (value) => print(value),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text.rich(
          TextSpan(
              text: "Kalan karakter : ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: "1500",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: gray,
                      ),
                )
              ]),
        )
      ],
    );
  }
}

class _SendButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () {},
      child: Text(
        "Gönder",
        style: Theme.of(context).textTheme.displaySmall!.copyWith(color: white),
      ),
    );
  }
}
