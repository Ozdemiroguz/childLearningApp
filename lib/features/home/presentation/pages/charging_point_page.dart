import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/custom/custom_checkbox_tile.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/features/home/presentation/widgets/widget.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../common/circular_back_container.dart';
import '../../../../router/router.dart';
import '../../../test/testprovider.dart';
import '../../domain/models/charging_point.dart';

//bool dçndüren provider oluşturulacak

@RoutePage()
class ChargingPointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: const CustomAppBar(
        backgroundColor: darkBgColor,
        leadingText: "Dolum Noktaları",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              ChargingPointSearch(),
              SizedBox(
                height: 12.h,
              ),
              FilterAndMapSection(
                onPressed: () {
                  showModalBottomSheet(
                    elevation: 0,
                    barrierColor: Colors.transparent,
                    //arkaplan şeffaf olacak
                    context: context,
                    builder: (context) {
                      return BottomSheetContent();
                    },
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              ChargingPointList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChargingPointSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: CustomTextFieldBorderless(
        hintText: "Dolum Noktası Ara",
        prefixIcon: Container(
          padding: EdgeInsets.all(16.r),
          child: Assets.icons.search.svg(),
        ),
      ),
    );
  }
}

class ChargingPointList extends StatelessWidget {
  final List<ChargingPoint> chargingPoints = [
    ChargingPoint(
      name: "Büfe ",
      distance: "2 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
    ChargingPoint(
      name: "Market",
      distance: "6 km",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      child: Column(
        children: List.generate(
          chargingPoints.length,
          (index) => Column(
            children: [
              ChargingPointInfo(
                chargingPoint: chargingPoints[index],
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
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

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      padding:
          EdgeInsets.only(top: 38.w, left: 16.w, right: 16.w, bottom: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Filtrele",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          CustomCheckboxTileCircular(
            label: "Kiosk",
            value: true,
            onChanged: (value) {
              // ref.read(lineTypeProvider).state = value!;
            },
          ),
          SizedBox(
            height: 13.h,
          ),
          CustomCheckboxTileCircular(
            label: "Market",
            value: false,
            onChanged: (value) {
              // ref.read(lineTypeProvider).state = value!;
            },
          ),
        ],
      ),
    );
  }
}
