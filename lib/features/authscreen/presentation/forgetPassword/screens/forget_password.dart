import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_text_field.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_button.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authPagesScaffoldBackColor,
      body: Padding(
        padding: EdgeInsets.all(AppConst.scaffoldPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24.h),
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.appPrimaryColor,
                ),
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back),
              ),
              // * LOGO
              Gap(48.h),
              AppLogo(),
              AuthPageTitle(title: "Forget Password?"),
              // * TEXT FIELD
              Gap(28.h),
              // * FORM
              AppTextField(
                labelText: "Enter Your Email",
                textEditingController: emailController,
              ),
              Gap(28.h),
              AuthButton(buttonName: "Reset link", ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
