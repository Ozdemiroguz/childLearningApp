import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/gen/assets.gen.dart';
import 'package:tododyst/router/router.dart';

import '../widdgets/back_button.dart';

@RoutePage()
class SupportPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              ProfileBackButton(),
              SizedBox(height: 80.h),
              _SupportPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(30.w),
      height: 450.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.images.support.image(),
          SizedBox(width: 10.w),
          Text("Support", style: Theme.of(context).textTheme.displayLarge),
          SizedBox(height: 20.h),
          Text("How can we help you?",
              style: Theme.of(context).textTheme.displaySmall),
          SizedBox(height: 20.h),
          _SupportButton(
            text: "Contact Us",
            image: Assets.images.contact,
            onPressed: () {
              context.router.push(const ContactRoute());
            },
          ),
          SizedBox(height: 10.h),
          _SupportButton(
            text: "Privacy Policy",
            image: Assets.images.p,
            onPressed: () {
              context.router.push(const PrivacyPolicyRoute());
            },
          ),
        ],
      ),
    );
  }
}

class _SupportButton extends StatelessWidget {
  final String text;
  final AssetGenImage image;
  final VoidCallback onPressed;

  const _SupportButton({
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(11.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: darkBlue1.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            image.image(),
            SizedBox(width: 10.w),
            Text(text, style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
