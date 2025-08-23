import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Balance extends StatelessWidget {
  final String? balance;
  const Balance({super.key, this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: AppColors.appbarBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: 'Balance: ',
            fontSize: 16.r,
            textColor: AppColors.appPrimaryTextColor,
          ),
          AppText(
            text: '${balance ?? 0} 🪙',
            fontSize: 18.r,
            textColor: AppColors.appPrimaryTextColor,
          ),
        ],
      ),
    );
  }
}
