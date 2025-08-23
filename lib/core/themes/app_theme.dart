import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // TODO APP THEME
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,

      // TODO INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConst.textfieldBorderRadius.r),
          borderSide: BorderSide.none,
        ),

        filled: true,
        fillColor: AppColors.textFieldBackColor,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.0.r,
          horizontal: 20.0.r,
        ),
      ),

      // TODO  TEXT THEME
      textTheme: TextTheme(
        labelLarge: GoogleFonts.merriweather(
          fontSize: 24.r,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.merriweather(
          fontSize: 14.r,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
