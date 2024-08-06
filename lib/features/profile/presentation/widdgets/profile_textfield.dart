import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tododyst/constants/colors.dart';

class ProfileTextfield extends HookWidget {
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final String? hintText;
  final String? initialValue;

  const ProfileTextfield({
    this.onEditingComplete,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          Theme.of(context).textTheme.displayMedium!.copyWith(color: darkBlue1),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintStyle:
            Theme.of(context).textTheme.displayMedium!.copyWith(color: blue),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: blue),
        ),
        filled: true,
        fillColor: bgColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: blue),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      ),
    );
  }
}
