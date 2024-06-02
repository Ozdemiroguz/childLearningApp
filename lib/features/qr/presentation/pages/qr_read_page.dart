import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';

import '../../../../custom/custom_app_bar.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/widgets.dart';

@RoutePage()
class QrReadPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
        leading: Row(),
        actions: [
          XIcon(
            color: white,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // color:  AppColors.primary.withOpacity(0.52),
          image: DecorationImage(
            image: AssetImage(Assets.images.exclude.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 92.h,
              ),
              const TitlePart(
                color: white,
                text1: "QR Kod Okut",
                text2: "QR kodunu cihaza okut",
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: QrButtons(),
              ),
              SizedBox(
                height: 129.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
