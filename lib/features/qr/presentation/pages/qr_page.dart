import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';

import '../../../../gen/assets.gen.dart';
import '../widgets/widgets.dart';

@RoutePage()
class QrPage extends ConsumerWidget {
  const QrPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: const CustomAppBar(
        backgroundColor: darkBgColor,
        leading: Row(),
        actions: [
          XIcon(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 42.h,
              ),
              const TitlePart(
                text1: "QR Kod ile Öde",
                text2: "QR kodunu cihaza okut",
              ),
              SizedBox(
                height: 82.h,
              ),
              QrPart(),
              SizedBox(
                height: 40.h,
              ),
              BalancePart(),
              SizedBox(
                height: 40.h,
              ),
              QrButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class QrPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        //tıklandığı zaman bilgi dialogu gelecek
        showDialog(
          context: context,
          builder: (context) => SuccesfulAlertDialogContent(),
        );
      },
      child: SizedBox(
        height: 271.h,
        width: 271.w,
        child: Image.asset(
          "assets/images/qrImage.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BalancePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.r,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          Text(
            "Kalan Bakiye",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            "27.50 ₺",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.orange,
                ),
          ),
        ],
      ),
    );
  }
}

class SuccesfulAlertDialogContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      backgroundColor: darkBgColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Container(
        width: 328.w,
        height: 300.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 36.h),
        child: Column(
          children: [
            Assets.images.check.image(),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Ödeme Tamamlandı",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.primary800),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Ana sayfaya yönlendirileceksiniz.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary800,
                  ),
            ),
            SizedBox(
              height: 36.h,
            ),
            BalancePart(),
          ],
        ),
      ),
    );
  }
}

class FailAlertDialogContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: darkBgColor,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 328.w,
        height: 300.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 36.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.carpi.image(),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Ödeme Başarısız",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.primary800),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Lütfen tekrar deneyiniz.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary800,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
