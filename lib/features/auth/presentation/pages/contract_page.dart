
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/features/auth/presentation/providers/register_provider.dart';
import 'package:rota/gen/assets.gen.dart';

import '../../../../custom/custom_app_bar.dart';


@RoutePage()
class ContractPage extends ConsumerWidget {
 final  String contractName;
 final int index;
  const ContractPage({required this.contractName, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return Scaffold(
      appBar:CustomAppBar(
      leading: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Assets.icons.arrowLeft.svg(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            contractName,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],

      ),
      onBackPressed: () => Navigator.pop(context),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: Column
        (
          children: [
            const Spacer(),
            ConfirmButton(index: index),
            SizedBox(height: 41.h),
            
          ],
        ),
      ),

  
    );
  }
}
class ConfirmButton extends ConsumerWidget {
  final int index;
  const ConfirmButton({required this.index});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final bool check = ref.read(registerProvider).agreementCheckList[index];

    return SizedBox(
      width: double.infinity,
      height: 56.h,

      child: CustomFilledButton
      (
        onPressed: () {
          ref.read(registerProvider.notifier).onChangedCheckList(index);
        },
        color: check ? Theme.of(context).colorScheme.primary : const Color(0xffD9D9D9),
        child:  const Text("Onayla",style: TextStyle(
          color: red,
          
        ),),
      ),
    );
  }
}
