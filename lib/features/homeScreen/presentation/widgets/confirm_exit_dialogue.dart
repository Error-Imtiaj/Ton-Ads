import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmExitDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;

  const ConfirmExitDialog({
    super.key,
    this.title = "Exit App",
    this.content = "Do you really want to leave the app?",
    this.confirmText = "Yes",
    this.cancelText = "No",
  });

  
  static Future<bool> show(
    BuildContext context, {
    String title = "Exit App",
    String content = "Do you really want to leave the app?",
    String confirmText = "Yes",
    String cancelText = "No",
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmExitDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16.h),
      ),
      title: AppText(text: title, fontSize: 14.sp),
      content: AppText(text: content, fontSize: 16.sp),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: AppText(
            text: cancelText,
            textColor: AppColors.appPrimaryColor,
            fontSize: 14.sp,
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: AppText(
            text: confirmText,
            textColor: AppColors.appPrimaryColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
