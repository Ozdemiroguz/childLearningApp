import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tododyst/custom/custom_filled_button.dart';

import '../../../../constants/colors.dart';

class ProfileButton extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;
  const ProfileButton({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomFilledButton(
      onPressed: onTap,
      buttonText: title,
    );
  }
}
