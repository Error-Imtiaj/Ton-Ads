import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchAdsTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color tileColor;
  const WatchAdsTile({super.key, required this.title, this.onTap, required this.tileColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText(text: title, fontSize: 14.sp),
      tileColor: tileColor,
      dense: true,
      trailing: AppText(
        text: 'view Ads',
        fontSize: 14.sp,
        textColor: AppColors.appPrimaryTextColor,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12.r),
      ),
      onTap: onTap,
    );
  }
}
