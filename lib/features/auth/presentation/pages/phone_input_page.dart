import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_custom.dart';
import 'package:tododyst/constants/colors.dart';
import 'package:tododyst/features/auth/presentation/providers/register_provider.dart';
import 'package:tododyst/router/router.dart';
import 'package:tododyst/utils/text_input_formatters.dart';

import '../../../../custom/custom_filled_button.dart';
import '../../../../custom/custom_text_field.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class PhoneInputPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.r),
        child: Center(
          child: Form(
            key: ref.watch(_keyProvider),
            child: Column(
              children: [
                SizedBox(height: 248.h),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to ToDoDys',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 46.sp,
                      ),
                ),
                SizedBox(height: 20.h),
                _PhoneInput(),
                SizedBox(height: 20.h),
                _GetCodeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FocusNode _focusNode = FocusNode();
    final notifier = ref.watch(registerProvider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: lightBlue0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
            ),
          ),
          child: CountryCodePicker(
            hideSearch: true,
            countryFilter: const [
              'TR',
              'US',
              'GB',
              'DE',
              'FR',
              'ES',
              'IT',
              'RU',
              'Hu',
            ],
            onChanged: (CountryCode? countryCode) =>
                notifier.onChangedCountryCode(countryCode!.dialCode),
            initialSelection: 'TR',
            favorite: const ['+90', 'TR'],
          ),
        ),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.number,
            focusNode: _focusNode,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              PhoneNumberFormatter(),
            ],
            validator: (value) => ref
                .read(registerProvider)
                .phoneNumberFailure
                .toNullable()
                ?.message,
            onChanged: notifier.onChangedPhoneNumber,
            onFieldSubmitted: notifier.onChangedPhoneNumber,
            onSaved: notifier.onChangedPhoneNumber,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: darkGray1,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
            hintText: 'Phone Number',
          ),
        ),
      ],
    );
  }
}

class _GetCodeButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: () {
        final formState = ref.watch(_keyProvider).currentState;

        formState
          ?..save()
          ..validate();

        if (formState!.validate()) {
          context.router.push(PhoneVerificationRoute());
        }
      },
      buttonText: 'Get Code',
      color: blue,
    );
  }
}
