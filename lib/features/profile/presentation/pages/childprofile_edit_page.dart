import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/user_provider.dart';
import '../widdgets/profile_image.dart';
import '../widdgets/profile_textfield.dart';

@RoutePage()
class ChildprofileEditPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              const ProfileImage(
                size: 140,
                isChildAccount: true,
              ),
              SizedBox(height: 80.h),
              ProfileTextfield(
                hintText: user.name,
              ),
              SizedBox(height: 20.h),
              ProfileTextfield(
                hintText: user.surname,
              ),
              SizedBox(height: 20.h),
              ProfileTextfield(
                hintText: user.age,
              ),
              SizedBox(height: 20.h),
              ProfileTextfield(
                hintText: "Lorem Ipsum",
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
