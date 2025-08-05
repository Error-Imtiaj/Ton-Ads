import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.errorSnackBarTextColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
