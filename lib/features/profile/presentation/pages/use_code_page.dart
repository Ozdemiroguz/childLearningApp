import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/profile/presentation/widdgets/back_button.dart';
import 'package:tododyst/features/profile/presentation/widdgets/profile_button.dart';
import 'package:tododyst/gen/assets.gen.dart';

@RoutePage()
class UseCodePage extends ConsumerWidget {
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
              _UseCodePart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UseCodePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(30.w),
      height: 450.h,
      child: Column(
        children: [
          Row(
            children: [
              Assets.images.gift.image(),
              SizedBox(width: 10.w),
              Text(
                "Use the code",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 200.w,
            child: TextFormField(
              style: const TextStyle(color: black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffC4C4C4)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffC4C4C4)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                fillColor: lightGray,
                filled: true,
                hintText: "Enter the code",
                hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: black,
                    ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ProfileButton(
            title: "Save",
            onTap: () {
              showAdaptiveDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: purple1,
                    content: SizedBox(
                      height: 200.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300.w,
                          ),
                          Assets.images.checkcirclewithstar.image(
                            width: 50.w,
                            height: 50.h,
                          ),
                          Text(
                            "The code has been saved",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: white),
                          ),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                  );
                  // SizedBox(
                  //   height: 100.h,
                  //   width: context.screenWidth - 68,
                  //   child: Expanded(
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: purple1,
                  //         borderRadius: BorderRadius.circular(10.r),
                  //       ),
                  //       height: 100.h,
                  //       width: context.screenWidth - 68,
                  //     ),
                  //   ),
                  // );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
