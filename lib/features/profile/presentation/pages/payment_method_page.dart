import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rota/common/circular_back_container.dart';
import 'package:rota/custom/custom_app_bar.dart';
import 'package:rota/theme/theme.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_filled_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../router/router.dart';

@RoutePage()
class PaymentMethodPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingText: 'Ödeme Yöntemlerim',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            _CreditCardList(),
            SizedBox(
              height: 43.h,
            ),
            _AddNewCardButton(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}

class _CreditCardList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(
          _cards.length,
          (index) => Column(
                children: [
                  if (index == 0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Text(
                          'Kayıtlı Banka Kartlarım',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.primary600,
                                  ),
                        ),
                      ),
                    ),
                  _CreditCardItem(
                    card: _cards[index],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              )),
    );
  }
}

class _CreditCardItem extends StatelessWidget {
  final _CreditCard card;

  const _CreditCardItem({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primary600,
                width: 1.w,
              ),
              shape: BoxShape.circle,
              color:
                  card.isSelected ? AppColors.primary600 : Colors.transparent,
            ),
          ),
          SizedBox(
            width: 17.w,
          ),
          Column(
            children: [
              Text(
                card.cardType,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.primary700,
                    ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                card.cardNumber,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.primary300,
                    ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              card.carBrand == 'Ziraat Bankası'
                  ? Assets.images.ziraatBankasi.image()
                  : Assets.images.yapiKredi.image(),
              SizedBox(
                width: 14.w,
              ),
              card.cardType == 'Visa'
                  ? Assets.images.visa.image()
                  : Assets.images.mastercard.image(),
            ],
          ),
          SizedBox(
            width: 26.w,
          ),
          GestureDetector(
            onTap: () {},
            child: Assets.icons.trash.svg(),
          )
        ],
      ),
    );
  }
}

class _AddNewCardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFilledButton(
          onPressed: () {
            context.router.push(const AddNewCardRoute());
          },
          color: bgColor,
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              CircularBackContainer(
                  size: 24.r,
                  color: AppColors.orange,
                  child: Text(
                    '+',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: white,
                        ),
                  )),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Yeni Banka Kartı Ekle',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.orange,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Text(
          "Kartını güvenli bir şekilde saklayabilir, istediğinde silebilirsin.",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: gray),
        )
      ],
    );
  }
}

class _CreditCard {
  final String cardNumber;
  final String carBrand;
  final String cardType;
  final bool isSelected;

  const _CreditCard({
    required this.cardNumber,
    required this.carBrand,
    required this.cardType,
    required this.isSelected,
  });
}

List<_CreditCard> _cards = [
  _CreditCard(
    cardNumber: '******8990',
    carBrand: 'Yapı Kredi',
    cardType: 'Visa',
    isSelected: true,
  ),
  _CreditCard(
    cardNumber: '******8990',
    carBrand: 'Ziraat Bankası',
    cardType: 'Visa',
    isSelected: false,
  ),
  _CreditCard(
    cardNumber: '******8990',
    carBrand: 'Ziraat Bankası',
    cardType: 'MasterCard',
    isSelected: false,
  ),
];
