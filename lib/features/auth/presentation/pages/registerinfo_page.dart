import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/features/auth/presentation/providers/register_provider.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../custom/custom_text_field.dart';
import '../../../../router/router.dart';

@RoutePage()
class RegisterInfoPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);

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
              "Bilgilerim",
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
              IdentityCardNumberInput(),
              SizedBox(
                height: 20.h,
              ),
              NameInput(),
              SizedBox(
                height: 20.h,
              ),
              SurnameInput(),
              SizedBox(
                height: 20.h,
              ),
              BirthDateInput(),
              SizedBox(
                height: 20.h,
              ),
              MailInput(),
              SizedBox(
                height: 24.h,
              ),
              AgreementPart(),
              SizedBox(
                height: 47.h,
              ),
              RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class IdentityCardNumberInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: "TC Kimlik Numarası*",
      textInputType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class NameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: "Ad* ",
      textInputType: TextInputType.name,
      onChanged: (value) {
        ref.read(registerProvider.notifier).onChangedPassword(value);
      },
    );
  }
}

class SurnameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomTextField(
      hintText: "Soyad*",
      textInputType: TextInputType.name,
    );
  }
}

class BirthDateInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      hintText: "Doğum Tarihi(gg.aa.yyyy)",
      textInputType: TextInputType.datetime,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

//mail
class MailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomTextField(
      hintText: "E-posta*",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class AgreementPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    // csutom olarka checkboxlar ele alıncak
    return Column(
      children: [
        const AgreementCheckBox(
          contractName: "Ticari Elektronik İleti İzni ",
          index: 0,
        ),
        SizedBox(
          height: 17.h,
        ),
        const AgreementCheckBox(contractName: "Açık Rıza Metni", index: 1),
        SizedBox(
          height: 17.h,
        ),
        const AgreementCheckBox(
          contractName: "KVKK Aydınlatma Metni",
          index: 2,
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
          context.router.push(const RegisterPasswordRoute());
        },
        child: const Text("Devam Et"),
      ),
    );
  }
}

class AgreementCheckBox extends ConsumerWidget {
  final String contractName;
  final int index;

  const AgreementCheckBox({
    super.key,
    required this.contractName,
    required this.index,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool value = ref.read(registerProvider).agreementCheckList[index];
    ref.watch(registerProvider);
    return Row(
      children: [
        Container(
          width: 23.w,
          height: 23.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: value ? AppColors.orange : gray,
              width: 3.w,
            ),
          ),
          child: Checkbox(
            side: BorderSide.none,
            checkColor: Colors.orange, // check işaretinin rengi
            activeColor: Colors.transparent,
            value: value,
            onChanged: (value) {
              ref.watch(registerProvider.notifier).onChangedCheckList(index);
            },
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(
                        ContractRoute(
                          contractName: contractName,
                          index: index,
                        ),
                      );
                    },
                    child: Text(
                      contractName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.orange,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.orange,
                          ),
                    ),
                  ),
                ),
                TextSpan(
                  text: " 'ni okudum ve kabul ediyorum.",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary700,
                      ),
                ),
              ],
            ),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
