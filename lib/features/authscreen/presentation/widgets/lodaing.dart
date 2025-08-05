import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.authPagesScaffoldBackColor,
        color: AppColors.splashScreenBackgroundColor,
      ),
    );
  }
}
