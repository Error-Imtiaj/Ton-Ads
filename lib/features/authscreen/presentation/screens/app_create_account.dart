import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_assets.dart';
import 'package:earn_watching_ads/core/utils/passvalidator.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_text_field.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/textfield_box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AppCreateAccount extends StatelessWidget {
  const AppCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.authPagesScaffoldBackColor,
      body: Padding(
        padding: EdgeInsets.all(AppConst.scaffoldPadding.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LOGO
                Gap(100.h),
                Center(
                  child: SvgPicture.asset(
                    AppAssets.mainAppLogoPath,
                    width: 200.w,
                  ),
                ),
                Text(
                  "Create Your Account",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                // TEXT FIELD
                Gap(28.h),
                AppTextField(
                  labelText: "Email",
                  textEditingController: _emailController,
                ),
                Gap(28.h),
                AppTextField(
                  labelText: "Password",
                  obsecureText: true,
                  textEditingController: _passwordController,
                  validator: (value) => Passvalidator.passValidator(value),
                ),
                Gap(28.h),
                AppTextField(
                  labelText: "Confirm Password",
                  obsecureText: true,
                  textEditingController: _confirmPasswordController,
                  validator: (value) => Passvalidator.confirmPasswordValidator(
                    value,
                    _passwordController.text.trim(),
                  ),
                ),
                Gap(28.h),
                Container(
                  height: 56.h,
                  decoration:
                      TextfieldBoxDecoration.textFieldContainerDecoration(
                        context,
                        AppColors.appPrimaryColor,
                      ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.authPagesScaffoldBackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
