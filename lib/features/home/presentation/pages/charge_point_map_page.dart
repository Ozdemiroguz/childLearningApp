import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../common/chat_bubble.dart';
import '../../../test/testprovider.dart';
import '../../domain/models/charging_point.dart';
import '../widgets/widget.dart';

@RoutePage()
class ChargePointMapPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPart(),
          Positioned(top: 77.h, child: SearchBarPart()),
          DragablePart(),
        ],
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
}

class DragablePart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.11,
      minChildSize: 0.11,
      maxChildSize: 0.9,
      builder: (
        BuildContext context,
        scrollController,
      ) {
        return Container(
          decoration: BoxDecoration(
            color: darkBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: DragableList(
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}

class DragableList extends ConsumerWidget {
  final ScrollController scrollController;
  const DragableList({required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ChargingPoint> chargingPoints =
        ref.read(testProvider).charginPoinstList;

    // TODO: implement build
    return ListView.builder(
      controller: scrollController,
      itemCount: chargingPoints.length + 1,
      padding: EdgeInsets.only(right: 16.w, left: 16.w),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return TitlePart();
        }
        return Column(
          children: [
            ChargingPointInfo(
              chargingPoint: chargingPoints[index - 1],
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        );
      },
    );
  }
}

class TitlePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 104.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Text(
              "Dolum Noktaları",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          children: [
            Text(
              "Yakınlardaki Dolum Noktaları",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.primary400,
                  ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }
}
