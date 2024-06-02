import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_dropdown_button_formfield.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../router/router.dart';
import '../../../../utils/input_formatters.dart';

@RoutePage()
class RegisterPhonePage extends ConsumerWidget {
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
                height: 216.h,
              ),
              InfoPart(),
              SizedBox(
                height: 29.h,
              ),
              PhoneNumber(),
              SizedBox(
                height: 152.h,
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
          "Telefon Numaranı Gir",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        // Text("Telefon Numaranı Gir",style:TextStyle(color: AppColors.primary600,fontSize: 20.sp,fontWeight: FontWeight.w500),),

        Text(
          "Telefonuna doğrulama kodu göndereceğiz.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class PhoneNumber extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomDropdownButtonFormField(
            items: [
              DropdownMenuItem(
                value: "+90",
                child: Row(
                  children: [
                    Container(
                      width: 42.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset(
                        'assets/images/tr.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      "+90",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
            value: "+90",
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          width: 9.w,
        ),
        Expanded(
          flex: 7,
          child: CustomTextField(
            hintText: "(___) ___ __ __",
            textInputType: TextInputType.phone,
            inputFormatters: phoneNumberInputFormatters(),
            onChanged: (value) {},
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
          context.router.push(const RegisterVerificationRoute());
        },
        child: const Text("Devam Et"),
      ),
    );
  }
}
