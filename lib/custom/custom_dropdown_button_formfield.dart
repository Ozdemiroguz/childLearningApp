import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';
import '../constants/shadows.dart';
import '../gen/assets.gen.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final T? value;
  final String? labelText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? color;
  final String? prefixIconPath;
  final ColorFilter? prefixIconColorFilter;
  final bool iconVisibility;
  final bool isDeselectActive;

  const CustomDropdownButtonFormField({
    required this.items,
    this.onChanged,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.contentPadding,
    this.value,
    this.color,
    this.prefixIconPath,
    this.prefixIconColorFilter,
    this.iconVisibility = true,
    this.isDeselectActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IgnorePointer(
            ignoring: onChanged == null,
            child: DropdownButtonFormField2<T>(
              items: items
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e.value,
                      //açılan kısmın
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        child: e.child,
                      ),
                    ),
                  )
                  .toList(),
              hint: hintText != null
                  ? Text(
                      hintText!,
                      style: hintStyle ??
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: color ?? darkBlue1.withOpacity(.4),
                              ),
                    )
                  : null,
              value: value,
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.zero,
                // selectedMenuItemBuilder: (context, child) {
                //   return DecoratedBox(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(6.r),
                //       color: primary,
                //     ),
                //     child: DefaultTextStyle(
                //       style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white),
                //       child: child,
                //     ),
                //   );
                // },
              ),
              buttonStyleData: const ButtonStyleData(padding: EdgeInsets.zero),
              decoration: InputDecoration(
                // constraints: BoxConstraints.loose(Size(double.infinity, 140.h)),
                enabled: onChanged != null,
                contentPadding: contentPadding ??
                    EdgeInsets.only(
                      top: 16.h,
                      bottom: 16.h,
                      left: 6.w,
                      right: 4.w,
                    ),
                prefixIconConstraints: BoxConstraints.expand(
                  width: 56.r,
                  height: 56.r,
                ),
                prefixIcon: prefixIconPath != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: SvgPicture.asset(
                          prefixIconPath!,
                          height: 20.r,
                          width: 20.r,
                          fit: BoxFit.scaleDown,
                          colorFilter: prefixIconColorFilter,
                        ),
                      )
                    : null,
                label: labelText != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(labelText!),
                      )
                    : null,
                isCollapsed: true,
                fillColor: lightBlue0,
                labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
              style: hintStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: darkBlue1),
              dropdownStyleData: DropdownStyleData(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                offset: Offset(0, -8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: ligthBlue, width: 2.r),
                  color: Colors.white,
                  boxShadow: [dropdownShadow],
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Visibility(
                  visible: onChanged != null && iconVisibility,
                  child: Assets.icons.arrowDown.svg(
                    height: 20.r,
                    width: 20.r,
                    colorFilter: color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null,
                  ),
                ),
                openMenuIcon: RotatedBox(
                  quarterTurns: 2,
                  child: Assets.icons.arrowDown.svg(
                    height: 20.r,
                    width: 20.r,
                    colorFilter: color != null
                        ? ColorFilter.mode(color!, BlendMode.srcIn)
                        : null,
                  ),
                ),
                iconEnabledColor: darkBlue1,
                iconSize: 24.r,
              ),
              isExpanded: true,
              onChanged: (value) => onChanged!.call(value),
              onSaved: onChanged,
              validator: validator,
              selectedItemBuilder: (context) =>
                  items.map((e) => e.child).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
