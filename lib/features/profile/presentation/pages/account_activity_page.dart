import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';

import '../../../../custom/custom_app_bar.dart';

@RoutePage()
class AccountActivityPage extends ConsumerWidget {
  const AccountActivityPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: 'Hesap Hareketlerim',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: _ActivtyItemList(),
      ),
    );
  }
}

class _ActivtyItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: List.generate(
      _activtyItemList.length,
      (index) => Column(
        children: [
          _ActivtyItem(
            activty: Activty(
                title: _activtyItemList[index].title,
                date: _activtyItemList[index].date,
                amount: _activtyItemList[index].amount,
                status: _activtyItemList[index].status),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    ));
  }
}

class _ActivtyItem extends ConsumerWidget {
  final Activty activty;

  _ActivtyItem({required this.activty});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                activty.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.primary800,
                    ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                activty.date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: gray,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            activty.status ? '+${activty.amount} TL' : '-${activty.amount} TL',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: activty.status ? green : red),
          )
        ],
      ),
    );
  }
}

class Activty {
  final String title;
  final String date;
  final String amount;
  final bool status;
  Activty(
      {required this.title,
      required this.date,
      required this.amount,
      required this.status});
}

List<Activty> _activtyItemList = [
  Activty(
    title: 'Bakiye Yükleme',
    date: '23/04/2024  18:40',
    amount: '100',
    status: true,
  ),
  Activty(
    title: 'Harcama - Yolculuk',
    date: '23/04/2024  18:40',
    amount: '10',
    status: false,
  ),
  Activty(
    title: 'Aktarma',
    date: '23/04/2024  18:40',
    amount: '1.5',
    status: false,
  ),
  Activty(
    title: 'Harcama - Yolculuk',
    date: '23/04/2024  18:40',
    amount: '20',
    status: false,
  ),
  Activty(
    title: 'Bakiye Yükleme',
    date: '23/04/2024  18:40',
    amount: '100',
    status: true,
  ),
];
