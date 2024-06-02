import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';

@RoutePage()
//statefull widget
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 99.h,
            bottom: 40.h,
          ),
          child: Column(
            children: [
              Logo(),
              SizedBox(height: 38.h),
              _UserNamePhoneMail(),
              SizedBox(
                height: 16.h,
              ),
              Password(),
              SizedBox(
                height: 19.h,
              ),
              ForgotPassword(),
              SizedBox(
                height: 19.h,
              ),
              LoginButton(),
              SizedBox(
                height: 50.h,
              ),
              RegisterDirection(),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: logoBack,
            borderRadius: BorderRadius.circular(11.r),
            border: Border.all(color: white, width: 3.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 12.r,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          width: 133.r,
          height: 133.r,
          child: Assets.icons.tramvay.svg(),
        ),
      ],
    );
  }
}

class _UserNamePhoneMail extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomTextField(
      hintText: "Kullanıcı adı, e-posta , telefon",
    );
  }
}

class Password extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomTextField(
      hintText: "Şifre",
    );
  }
}

class ForgotPassword extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Şifreni mi unuttun?",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: gray,
              ),
        ),
      ),
    );
  }
}

class LoginButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      // width: double.infinity,
      // height: 56.h,
      child: CustomFilledButton(
        onPressed: () {
          AutoRouter.of(context).replace(const MainRoute());
        },
        child: const Text("Giriş Yap"),
      ),
    );
  }
}

class RegisterDirection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hesabın yok mu? ",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.primary700,
              ),
        ),
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).replace(const RegisterPhoneRoute());
          },
          child: Text(
            "Kayıt Ol",
            //altı çizili

            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orange,
                  decorationThickness: 1.5,
                ),
          ),
        ),
      ],
    );
  }
}
