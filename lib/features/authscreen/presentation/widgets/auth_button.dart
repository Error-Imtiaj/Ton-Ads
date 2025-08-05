import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/textfield_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? ontap;

  const AuthButton({super.key, required this.buttonName, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // keep transparent if using custom background
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          height: 56.h,
          decoration: TextfieldBoxDecoration.textFieldContainerDecoration(
            context: context,
            backgroundColor: AppColors.appPrimaryColor,
            shadowColor: AppColors.appPrimaryColor,
          ),
          child: Center(
            child: Text(
              buttonName,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.authPagesScaffoldBackColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
