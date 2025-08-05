import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_assets.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/core/utils/passvalidator.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_text_field.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_button.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/redirect_from_login.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/signup_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AppLogin extends StatefulWidget {
  const AppLogin({super.key});

  @override
  State<AppLogin> createState() => _AppLoginState();
}

class _AppLoginState extends State<AppLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authPagesScaffoldBackColor,
      body: Padding(
        padding: EdgeInsets.all(AppConst.scaffoldPadding.w),
        child: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * LOGO
                Gap(100.h),
                AppLogo(),
                AuthPageTitle(title: "Login to our Account"),
                // * TEXT FIELD
                Gap(28.h),
                // * FORM
                AppTextField(
                  labelText: "Email",
                  textEditingController: emailController,
                ),
                Gap(28.h),
                AppTextField(
                  labelText: "Password",
                  obsecureText: true,
                  textEditingController: passController,
                  validator: (value) => Passvalidator.passValidator(value),
                ),
                Gap(28.h),
                AuthButton(
                  buttonName: "Sign in",
                  ontap: () {
                    print('Hello');
                  },
                ),
                Gap(56.h),
                Center(
                  child: Text(
                    "--Or sign in with --",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Gap(28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignupIconWidget(svgAssetPath: AppAssets.fbLogo),
                    Gap(24.w),
                    SignupIconWidget(svgAssetPath: AppAssets.googleLogo),
                  ],
                ),
                Gap(28.h),
                RedirectFromLogin(
                  ontap: () {
                    // 👉 Navigate to register page
                    context.pushNamed(AppRoutes.signUpRouteName);
                  },
                ),
                Gap(14.h),
                RedirectFromLogin(
                  maintext: "",
                  linktext: "Forget Password",
                  ontap: () {
                    // 👉 Navigate to register page
                    context.pushNamed(AppRoutes.forgetRouteName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
