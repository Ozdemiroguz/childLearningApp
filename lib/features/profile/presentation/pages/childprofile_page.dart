import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tododyst/features/profile/presentation/widdgets/profile_image.dart';
import 'package:tododyst/gen/assets.gen.dart';

import '../../../../router/router.dart';
import '../widdgets/profile_route_button.dart';

@RoutePage()
class ChildprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100.h),
              const ProfileImage(size: 110, isChildAccount: true),
              SizedBox(height: 80.h),
              ProfileRouteButtons(
                title: "Personal Information",
                onTap: () {
                  context.router.push(const ChildprofileEditRoute());
                },
                icon: Assets.icons.solarPenBroken,
              ),
              SizedBox(height: 25.h),
              ProfileRouteButtons(
                title: "Lorem Ipsum",
                onTap: () {},
              ),
              SizedBox(height: 25.h),
              ProfileRouteButtons(
                title: "Lorem Ipsum",
                onTap: () {},
              ),
              SizedBox(height: 25.h),
              ProfileRouteButtons(
                title: "Lorem Ipsum",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
