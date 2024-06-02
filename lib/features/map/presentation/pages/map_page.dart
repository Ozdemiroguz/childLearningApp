import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/core/extensions/context_extensions.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_draggable_scrollable_sheet.dart';
import 'package:rota/custom/custom_map.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/features/home/domain/models/line.dart';
import 'package:rota/features/test/testprovider.dart';
import 'package:rota/gen/assets.gen.dart';
import 'package:rota/router/router.dart';

import '../../../../common/line_info.dart';
import '../../../home/presentation/widgets/widget.dart';

@RoutePage()
class MapPage extends ConsumerWidget {
  const MapPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider);
    final bool rotation = ref.watch(testProvider).testbool2;
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        onBackPressed: () {
          ref.read(testProvider.notifier).onChangedTestBool2(false);
        },
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPart(),
          Positioned(
            top: 77.h,
            child: rotation == true ? RotationPart() : SearchBarPart(),
          ),
          DraggableScrollableSheetPart(),
        ],
      ),
    );
  }
}

class MapPart extends ConsumerWidget {
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomMap(
      markers: [
        buildMarker(
          const LatLng(
            39.782499,
            30.510203,
          ),
          ref,
        ),
        buildMarker(
          const LatLng(
            39.781278,
            30.510020,
          ),
          ref,
        ),
        buildMarker(
          const LatLng(
            39.780278,
            30.510020,
          ),
          ref,
        ),
        buildMarker(
          const LatLng(
            39.780278,
            30.511020,
          ),
          ref,
        ),
        buildMarker(
          const LatLng(
            39.780278,
            30.512020,
          ),
          ref,
        ),
        buildMarker(
          const LatLng(
            39.780278,
            30.513020,
          ),
          ref,
        ),
      ],
      mapController: mapController,
    );
  }
}

class RotationPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return SizedBox(
      width: context.screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              const RotationAdress(
                adress:
                    "Şirintepe mahallesi Girneliler sok. No: 41 Bahar Apart",
              ),
              SizedBox(height: 17.h),
              const RotationAdress(
                adress:
                    "Şirintepe mahallesi Girneliler sok. No: 41 Bahar Apart",
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotationAdress extends ConsumerWidget {
  final Color? color;
  final String adress;

  const RotationAdress({required this.adress, this.color});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Assets.icons.mapPin.svg(
          colorFilter:
              ColorFilter.mode(color ?? AppColors.orange, BlendMode.srcIn),
        ),
        SizedBox(width: 8.w),
        Text(
          color != null ? "Bitiş :" : "Başlangıç :",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: color ?? AppColors.orange),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            adress,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: gray),
          ),
        ),
      ],
    );
  }
}

class DraggableScrollableSheetPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool serach = ref.read(testProvider).testbool3;
    final bool rotation = !ref.watch(testProvider).testbool2;

    return CustomDraggableScrollableSheet(
      color: darkBgColor,
      title: rotation ? "Nereye" : null,
      children: [
        SizedBox(width: 16.h),
        Visibility(
          visible: rotation,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 277.w,
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        StartPointSerach(),
                        SizedBox(height: 16.h),
                        EndPointSearch(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 51.w,
                    child: Column(
                      children: [
                        Assets.icons.arrowsDownUp.svg(
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 29.5.w,
                child: TripleDot(),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        if (serach)
          rotation
              ? SerchingAllAdress()
              : const SelectedRotation(
                  lines: [
                    Line(
                      lineName: "Yürüyüş",
                      lineCode: "",
                      lineType: "Yürüyüş",
                    ),
                    Line(
                      lineName: "Şirintepe - Odunpazarı",
                      lineCode: "S19",
                      lineType: "Otobüs",
                    ),
                    Line(
                      lineName: "Ssk - Otogar",
                      lineCode: "1",
                      lineType: "Tramvay",
                    ),
                  ],
                )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SavedAdress(
                  title: "Ev",
                  adress:
                      "Şirintepe mahallesi Girneliler sok. No: 41 Bahar Apart",
                  icon: Assets.icons.homeMap,
                ),
                SizedBox(width: 16.w),
                SavedAdress(
                  title: "İş",
                  adress:
                      "Büyükdere, Osmangazi Ünv., 26040 Odunpazarı/Eskişehir",
                  icon: Assets.icons.work,
                ),
                SizedBox(width: 16.w),
                SavedAdress(
                  title: "Okul",
                  adress:
                      "Büyükdere, Osmangazi Ünv., 26040 Odunpazarı/Eskişehir",
                  icon: Assets.icons.school,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class StartPointSerach extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
        child: Assets.icons.mapPin.svg(),
      ),
      hintText: "Başlangıç Noktası",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: gray2,
          width: 0.5.r,
        ),
      ),
    );
  }
}

class EndPointSearch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          ref.read(testProvider.notifier).onChangedTestBool3(true);
        } else {
          ref.read(testProvider.notifier).onChangedTestBool3(false);
        }
      },
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
        child: Assets.icons.mapPin.svg(
          colorFilter:
              const ColorFilter.mode(AppColors.primary700, BlendMode.srcIn),
        ),
      ),
      hintText: "Başlangıç Noktası",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: gray2,
          width: 0.5.r,
        ),
      ),
    );
  }
}

class TripleDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Assets.icons.ellipse10.svg(),
          SizedBox(height: 8.h),
          Assets.icons.ellipse11.svg(),
          SizedBox(height: 8.h),
          Assets.icons.ellipse13.svg(),
        ],
      ),
    );
  }
}

class SavedAdress extends ConsumerWidget {
  final String title;
  final String adress;
  final SvgGenImage icon;

  const SavedAdress({
    required this.title,
    required this.adress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 88.h,
      width: 141.w,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: gray3,
          width: 0.5.r,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon.svg(),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.displaySmall),
                SizedBox(height: 2.h),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  adress,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: gray,
                        fontSize: 8.sp,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SerchingAllAdress extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SearchingTypeBar(),
        SizedBox(height: 16.h),
        SearchingAdress(
          title: "Eskişehir Teknik Üniversitesi",
          desc: "Eskişehir Teknik Üniversitesi",
          distance: "1.2 km",
          time: "5 dk",
          routes: [
            Route(icon: Assets.icons.walk, title: "Yürüyerek"),
            Route(icon: Assets.icons.araba, title: "Arabayla"),
            Route(icon: Assets.icons.tramvay, title: "Tramvayla"),
          ],
        ),
        SizedBox(height: 16.h),
        SearchingAdress(
          title: "Eskişehir Teknik Üniversitesi",
          desc: "Eskişehir Teknik Üniversitesi",
          distance: "1.2 km",
          time: "5 dk",
          routes: [
            Route(icon: Assets.icons.walk, title: "Yürüyerek"),
            Route(icon: Assets.icons.araba, title: "Arabayla"),
          ],
        ),
        SizedBox(height: 16.h),
        SearchingAdress(
          title: "Eskişehir Teknik Üniversitesi",
          desc: "Eskişehir Teknik Üniversitesi",
          distance: "1.2 km",
          time: "5 dk",
          routes: [
            Route(icon: Assets.icons.walk, title: "Yürüyerek"),
          ],
        ),
      ],
    );
  }
}

class SearchingTypeBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "Tümü",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: white,
                    ),
              ),
            ),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.walk, isActive: false),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.araba, isActive: true),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.tramvay, isActive: false),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.otobus, isActive: false),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.scooter, isActive: false),
            SizedBox(width: 16.w),
            SearchType(icon: Assets.icons.ship, isActive: false),
          ],
        ),
      ),
    );
  }
}

class SearchType extends ConsumerWidget {
  final bool isActive;
  final SvgGenImage icon;
  const SearchType({required this.icon, required this.isActive});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.orange : white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: icon.svg(
          colorFilter: ColorFilter.mode(
            isActive ? white : AppColors.primary800,
            BlendMode.srcIn,
          ),
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}

class SearchingAdress extends ConsumerWidget {
  // ignore: avoid_field_initializers_in_const_classes
  final bool rotation = false;

  final String title;
  final String desc;
  final String distance;
  final String time;
  final List<Route> routes;

  const SearchingAdress({
    required this.title,
    required this.desc,
    required this.distance,
    required this.time,
    required this.routes,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(testProvider.notifier).onChangedTestBool2(!rotation);
      },
      child: Container(
        padding: EdgeInsets.all(
          12.r,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (routes.length > 1)
                  Row(
                    children: List.generate(routes.length, (index) {
                      return Row(
                        children: [
                          if (routes[index].icon == Assets.icons.tramvay)
                            Container(
                              padding: EdgeInsets.all(
                                4.r,
                              ),
                              decoration: BoxDecoration(
                                color: gray4,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                children: [
                                  routes[index].icon.svg(
                                        width: 16.w,
                                        height: 16.h,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.orange,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                  SizedBox(width: 4.w),
                                  const Text("S19"),
                                ],
                              ),
                            ),
                          if (routes[index].icon != Assets.icons.tramvay)
                            routes[index].icon.svg(width: 24.w, height: 24.h),
                          SizedBox(width: 8.w),
                          if (index != routes.length - 1)
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.primary,
                            ),
                        ],
                      );
                    }),
                  )
                else
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      children: [
                        routes[0].icon.svg(width: 24.w, height: 24.h),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(width: 8.w),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.orange),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          "13 TL | ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          distance,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: gray),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              desc,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: gray, fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedRotation extends ConsumerWidget {
  final List<Line> lines;

  const SelectedRotation({
    required this.lines,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Column(
      children: List.generate(lines.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  LineInfo(
                    line: lines[index],
                  ),
                  if (lines[index].lineType == "Otobüs")
                    BusLineInfo(
                      line: lines[index],
                    ),
                  if (lines[index].lineType == "Tramvay")
                    TramLineInfo(
                      line: lines[index],
                    ),
                ],
              ),
            ),
            if (index != lines.length - 1)
              Padding(
                padding: EdgeInsets.only(left: 28.w),
                child: Container(
                  width: 11.w,
                  height: 20.h,
                  decoration: const BoxDecoration(color: AppColors.primary),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class BusLineInfo extends ConsumerWidget {
  final Line line;
  const BusLineInfo({
    required this.line,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement buil
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: gray5,
                width: 1.r,
              ),
            ),
          ),
          child: Column(
            children: List.generate(
              5,
              (index) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, bottom: 8.h, right: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        line.lineName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      if (index == 0)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Assets.icons.wifi.svg(),
                            ),
                            Text(
                              "7, 15, 30 ",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Text(
                              "dk",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        )
                      else
                        Text(
                          "16.00",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h, bottom: 10.h),
          child: Row(
            children: [
              Text(
                "Tüm Zamanlar",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.router.push(LineDetailRoute(line: line));
                },
                child: Icon(
                  size: 24.r,
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TramLineInfo extends ConsumerWidget {
  final Line line;
  const TramLineInfo({
    required this.line,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: gray5,
                width: 1.r,
              ),
            ),
          ),
          child: Column(
            children: List.generate(5, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Positioned(
                                bottom: index != 4 ? 0 : 10,
                                child: Container(
                                  color: AppColors.primary,
                                  width: 8.w,
                                  height: (index == 0) ? 10.h : 24.h,
                                ),
                              ),
                              if (index == 0)
                                Container(
                                  //circular
                                  decoration: const BoxDecoration(
                                    color: green,
                                    shape: BoxShape.circle,
                                  ),

                                  width: 20.w,
                                  height: 20.h,
                                )
                              else
                                Container(
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    border: Border.all(
                                      color: AppColors.primary,
                                      width: 2.r,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  width: 20.w,
                                  height: 20.h,
                                ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SizedBox(
                          height: 24.h,
                          child: Text(
                            line.lineName,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index != 4)
                    Padding(
                      padding: EdgeInsets.only(left: 22.w),
                      child: Container(
                        color: AppColors.primary,
                        width: 8.w,
                        height: 8.h,
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: 16.w, left: 16.w, top: 10.h, bottom: 10.h),
          child: Row(
            children: [
              Text(
                "Tüm Zamanlar",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.router.push(LineDetailRoute(line: line));
                },
                child: Icon(
                  size: 24.r,
                  Icons.chevron_right,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Route {
  final SvgGenImage icon;
  final String title;

  Route({required this.icon, required this.title});
}
