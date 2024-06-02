import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/route_button.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/features/home/domain/models/line.dart';
import 'package:rota/features/home/presentation/widgets/widget.dart';

import '../../../../common/line_info.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class FavoritePage extends ConsumerWidget {
  const FavoritePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingText: "Favorilerim",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 38,
            ),
            _FavoriteRoutes(),
            SizedBox(
              height: 43,
            ),
            _AddFavoriteButton(),
          ],
        ),
      ),
    );
  }
}

class _FavoriteRoutes extends ConsumerWidget {
  const _FavoriteRoutes();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        LineInfo(
          line: Line(
            lineCode: "S19",
            lineName: "Şirintepe-Odunpazarı",
            lineType: "Otobüs",
          ),
          isFavorite: true,
        ),
        SizedBox(
          height: 8.h,
        ),
        RouteButton(
          iconData: Assets.icons.starFilled.svg(),
          color: AppColors.orange,
          icon: Text(
            textAlign: TextAlign.center,
            "D",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: white),
          ),
          title: "Eczacılık Fakültesi ",
        ),
        SizedBox(
          height: 8.h,
        ),
        const LineInfo(
          line: Line(
            lineCode: "1",
            lineName: "Ssk-Otogar",
            lineType: "Tramvay",
          ),
          isFavorite: true,
        ),
        SizedBox(
          height: 8.h,
        ),
        RouteButton(
          iconData: Assets.icons.starFilled.svg(),
          color: AppColors.orange,
          icon: Text(
            textAlign: TextAlign.center,
            "D",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: white),
          ),
          title: "Hava Müzesi ",
        ),
        SizedBox(
          height: 8.h,
        ),
        RouteButton(
          icon: Assets.icons.araba.svg(),
          title: "Espark",
          iconData: Assets.icons.starFilled.svg(),
        ),
      ],
    );
  }
}

class _AddFavoriteButton extends ConsumerWidget {
  const _AddFavoriteButton();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
        color: AppColors.orange,
        onPressed: () {},
        child: Text(
          "+ Favori Ekle",
        ));
  }
}
