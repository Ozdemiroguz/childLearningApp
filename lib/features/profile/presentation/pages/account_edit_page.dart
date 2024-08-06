import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/features/profile/presentation/widdgets/profile_image.dart';

import '../../../../constants/colors.dart';
import '../widdgets/profile_textfield.dart';

@RoutePage()
class AccountEditPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              ProfileImage(size: 165, isChildAccount: false),
              SizedBox(height: 36.h),
              const ProfileTextfield(
                hintText: 'Name',
              ),
              SizedBox(height: 20.h),
              const ProfileTextfield(
                hintText: ' Surname',
              ),
              SizedBox(height: 20.h),
              const ProfileTextfield(
                hintText: 'Age',
              ),
              SizedBox(height: 20.h),
              const ProfileTextfield(
                hintText: 'Lorem Ipsum',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
