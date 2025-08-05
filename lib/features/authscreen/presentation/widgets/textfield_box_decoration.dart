import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextfieldBoxDecoration {
  static BoxDecoration textFieldContainerDecoration({
    BuildContext? context,
    Color? backgroundColor,
    Color? shadowColor = Colors.black,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppConst.textfieldBorderRadius.r),
      boxShadow: [
        BoxShadow(
          color: shadowColor!.withAlpha((0.05 * 255).round()),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}
