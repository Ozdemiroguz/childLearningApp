import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../common/chat_bubble.dart';
import '../../../../common/circular_back_container.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';
import '../../../test/testprovider.dart';
import '../../domain/models/charging_point.dart';
import '../../domain/models/line.dart';

class FilterAndMapSection extends ConsumerWidget {
  final VoidCallback onPressed;

  const FilterAndMapSection({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 44.h,
              child: CustomFilledButton(
                color: bgColor,
                onPressed: onPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ButtonContent(
                    color: AppColors.primary600,
                    text: "Filtrele",
                    icon: Assets.icons.filtre,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: SizedBox(
              height: 44.h,
              child: CustomFilledButton(
                color: bgColor,
                onPressed: () {},
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
                  child: ButtonContent(
                    color: AppColors.primary600,
                    text: "Harita",
                    icon: Assets.icons.map2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonContent extends StatelessWidget {
  final String text;
  final SvgGenImage icon;
  final Color color;

  const ButtonContent({
    required this.text,
    required this.icon,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon.svg(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: 24.w,
          height: 24.h,
        ),
        SizedBox(
          width: 12.w,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: color,
              ),
        ),
      ],
    );
  }
}

class MapButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? active;

  const MapButton({
    required this.onPressed,
    required this.active,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: active!
            ? Border.all(
                color: AppColors.primary600,
              )
            : Border.all(
                color: Colors.transparent,
              ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: CustomFilledButton(
        color: bgColor,
        onPressed: onPressed,
        child: ButtonContent(
          color: AppColors.primary600,
          text: "Harita",
          icon: Assets.icons.map2,
        ),
      ),
    );
  }
}

class ChargingPointInfo extends ConsumerWidget {
  final ChargingPoint chargingPoint;

  const ChargingPointInfo({
    required this.chargingPoint,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(testProvider);
    final bool visible = state.testbool1;

    return GestureDetector(
      onTap: () {
        ref.watch(testProvider.notifier).onChangedTestBool1(!visible);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.r,
          vertical: visible ? 16.h : 6.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircularBackContainer(
                  child: Assets.icons.market.svg(),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  chargingPoint.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Text(
                  chargingPoint.distance,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Visibility(
              visible: visible,
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "EskiBağlar Mahallesi , 123. Sokak No: 12",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 44.h,
                            child: CustomFilledButton(
                              child: ButtonContent(
                                icon: Assets.icons.directions,
                                text: "Yol Tarifi",
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 44.h,
                            child: MapButton(
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const ChargePointMapRoute());
                              },
                              active: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPart extends ConsumerWidget {
  final MapController mapController = MapController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider.notifier);

    // TODO: implement build
    return FlutterMap(
      mapController: mapController,
      options: const MapOptions(
        initialCenter: LatLng(
          39.782499,
          30.510203,
        ),
        initialZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
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
                39.784413,
                30.509086,
              ),
              ref,
            ),
            buildMarker(
              const LatLng(
                39.783446,
                30.506685,
              ),
              ref,
            ),
            buildMarker(
              const LatLng(
                39.785499,
                30.510203,
              ),
              ref,
            ),
            buildMarker(
              const LatLng(
                39.782499,
                30.512203,
              ),
              ref,
            ),
            buildMarker(
              const LatLng(
                39.782499,
                30.508203,
              ),
              ref,
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBarPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.h),
      height: 56.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(.2),
            blurRadius: 12,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: CustomTextFieldBorderless(
        hintText: "Durak,hat,konum ara...",
        prefixIcon: Container(
          padding: EdgeInsets.all(16.r),
          child: Assets.icons.search.svg(),
        ),
      ),
    );
  }
}

Marker buildMarker(LatLng point, WidgetRef ref) {
  final bool visible = ref.read(testProvider).testbool3;
  return Marker(
    width: 120.w,
    height: 90.h,
    point: point,
    child: GestureDetector(
      onTap: () {
        ref.read(testProvider.notifier).onChangedTestBool3(!visible);
        //   print(visible);
      },
      child: Column(
        children: [
          Visibility(
            visible: visible,
            child: const ChatBubble(
              message: "Dolum Noktası",
            ),
          ),
          const Spacer(),
          Assets.icons.vector.svg(),
        ],
      ),
    ),
  );
}
