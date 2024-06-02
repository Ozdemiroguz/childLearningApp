import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/route_button.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/features/home/domain/models/station.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../common/bacgrounded_appbar.dart';
import '../../../../router/router.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: const BackgroundedAppBar(
        child: CardBalance(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const CardBalancePart(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const LineSearchBar(),
                  SizedBox(
                    height: 32.h,
                  ),
                  CloseLinesPart(),
                  SizedBox(
                    height: 32.h,
                  ),
                  RouteButtonPart(),
                  SizedBox(
                    height: 32.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardBalance extends StatelessWidget {
  const CardBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 328.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 36.h,
                width: 36.w,
                padding: EdgeInsets.all(6.r),
                decoration: const BoxDecoration(
                  color: darkBgColor2,
                  shape: BoxShape.circle,
                ),
                child: Assets.icons.cuzdan.svg(),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eskartım Kalan Bakiye",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "27.50 TL",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.orange,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.primary600,
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          const Divider(
            color: gray,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CardNumber(),
        ],
      ),
    );
  }
}

class CardNumber extends ConsumerWidget {
  const CardNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          "Kart Numarası: ",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.primary,
              ),
        ),
        Text(
          "1234 5678 9012 3456",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: gray,
              ),
        ),
        const Spacer(),
        Assets.icons.frame.svg(
          width: 16.w,
          height: 16.h,
        ),
      ],
    );
  }
}

class LineSearchBar extends ConsumerWidget {
  const LineSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: CustomTextField(
        hintText: "Hat ara",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Assets.icons.search.svg(
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}

class CloseLinesPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Yakın Duraklar",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            Assets.icons.refresh.svg(
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                AppColors.orange,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        CloseLines(),
      ],
    );
  }
}

class CloseLines extends ConsumerWidget {
  final List<Station> station = [
    const Station(name: "Eczacılık Fakültesi", range: 100),
    const Station(name: "Kampüs", range: 200),
    const Station(name: "Kız Yurdu", range: 300),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: List.generate(
          station.length + 1,
          (index) => index == station.length
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "daha fazla göster...",
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.primary,
                            ),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: const BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "D",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        station[index].name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        "${station[index].range} m",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class RouteButtonPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        RouteButton(
          icon: Assets.icons.takvim.svg(),
          title: "Sefer Saatleri",
          callbackOut: () {
            context.router.push(const StationtimeRoute());
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        RouteButton(
          icon: Assets.icons.kurus.svg(),
          title: "Dolum Noktaları",
          callbackOut: () => context.router.push(const ChargingPointRoute()),
        ),
        SizedBox(
          height: 16.h,
        ),
        RouteButton(
          icon: Assets.icons.stars.svg(),
          title: "Favorilerim",
          callbackOut: () => context.router.push(const StationtimeRoute()),
        ),
        SizedBox(
          height: 16.h,
        ),
        RouteButton(
          icon: Assets.icons.stars.svg(),
          title: "Kampanyalar",
          callbackOut: () => context.router.push(const StationtimeRoute()),
        ),
      ],
    );
  }
}
