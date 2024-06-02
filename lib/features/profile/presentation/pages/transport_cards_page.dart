import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/circular_back_container.dart';
import 'package:rota/constants/colors.dart';
import 'package:rota/custom/custom_filled_button.dart';
import 'package:rota/custom/custom_text_field.dart';
import 'package:rota/features/test/testprovider.dart';

import '../../../../common/route_button.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class TransportCardsPage extends ConsumerWidget {
  const TransportCardsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: "Ulaşım Kartlarım",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            _AddNewCardButton(),
            SizedBox(
              height: 32.h,
            ),
            _TransportCardList(),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              color: gray3,
              height: 0.5.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            _AutoPaymentSwitch(),
            SizedBox(
              height: 16.h,
            ),
            _AutoPaymentPart(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNewCardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      onPressed: () {},
      color: AppColors.orange,
      child: Text(
        "+ Yeni Kart Ekle",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: bgColor,
            ),
      ),
    );
  }
}

class _TransportCardList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(_cards.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: _TransportCard(
            cardName: _cards[index].cardName,
            cardNumber: _cards[index].cardNumber,
          ),
        );
      }),
    );
  }
}

class _TransportCard extends ConsumerWidget {
  final String cardNumber;
  final String cardName;

  const _TransportCard({required this.cardNumber, required this.cardName});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider);
    // TODO: implement build
    return Container(
        padding: EdgeInsets.only(top: 6.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            RouteButton(
              icon: CircularBackContainer(
                child: Assets.icons.cuzdan.svg(),
              ),
              title: cardName,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.h, bottom: 12.h, left: 16.w, right: 16.w),
              child: Divider(color: gray2, height: 0.5.h),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 27.w, bottom: 16.h),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Kart Numarası: ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: cardNumber,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: gray,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          const ClipboardData(text: "textToCopy"));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Kopyalandı"),
                        ),
                      );
                    },
                    child: Assets.icons.frame.svg(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class _AutoPaymentSwitch extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider);
    final bool testbool2 = ref.read(testProvider).testbool2;
    // TODO: implement build
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: Row(
            children: [
              Text(
                "Otomatik Ödeme",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              CustomSwitch(
                onChanged: () {
                  ref
                      .read(testProvider.notifier)
                      .onChangedTestBool2(!testbool2);
                },
                switchValue: testbool2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "Bakiyeniz belirlediğiniz bir limit altına düştüğünde yükleme talimatı oluşturabilirsiniz",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: gray),
        ),
      ],
    );
  }
}

class CustomSwitch extends HookWidget {
  final VoidCallback onChanged;
  final bool switchValue;

  const CustomSwitch({
    required this.onChanged,
    required this.switchValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: EdgeInsets.all(2.r),
        height: 28.h,
        width: 56.w,
        decoration: BoxDecoration(
          color: switchValue ? AppColors.primary100 : Colors.transparent,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: gray3,
            width: 0.44.w,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: switchValue ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: switchValue ? AppColors.primary600 : gray3,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}

class _AutoPaymentPart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(testProvider);
    return Visibility(
      visible: ref.read(testProvider).testbool2,
      child: Column(
        children: [
          _MinBalanceInput(),
          SizedBox(
            height: 16.h,
          ),
          _DepositAmountInput(),
          SizedBox(
            height: 32.h,
          ),
          _DepositButton(),
        ],
      ),
    );
  }
}

class _MinBalanceInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bakiye şu tutarın altına düştüğünde",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
          hintText: "Tutar gir",
          textInputType: TextInputType.number,
          inputFormatters: [
            //diigts only
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class _DepositAmountInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Yüklencek tutar",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
          hintText: "Tutar gir",
          textInputType: TextInputType.number,
          inputFormatters: [
            //diigts only
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class _DepositButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () {},
      buttonText: "Devam Et",
    );
  }
}

class TransportCard {
  final String cardNumber;
  final String cardName;

  TransportCard({required this.cardNumber, required this.cardName});
}

List<TransportCard> _cards = [
  TransportCard(cardName: "Eskartım", cardNumber: "1234 5678 9012 3456"),
  TransportCard(cardName: "Babam Kart", cardNumber: "1234 5678 9012 3456"),
  TransportCard(cardName: "Annem Kart", cardNumber: "1234 5678 9012 3456"),
];
