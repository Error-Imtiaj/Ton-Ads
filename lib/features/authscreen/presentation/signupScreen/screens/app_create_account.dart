import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_assets.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/bloc/sign_up_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_snackbar.dart';
import 'package:earn_watching_ads/core/widgets/app_text_field.dart';
import 'package:earn_watching_ads/core/widgets/app_button.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/signup_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AppCreateAccount extends StatefulWidget {
  const AppCreateAccount({super.key});

  @override
  State<AppCreateAccount> createState() => _AppCreateAccountState();
}

class _AppCreateAccountState extends State<AppCreateAccount> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        signUpListener(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.authPagesScaffoldBackColor,
          body: Padding(
            padding: EdgeInsets.all(AppConst.scaffoldPadding.w),
            child: (state is SignUpLoading)
                ? Loading()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(24.h),
                        backButton(),
                        // * LOGO
                        Gap(48.h),
                        AppLogo(),
                        AuthPageTitle(title: "Create Your Account"),
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
                        ),
                        Gap(28.h),
                        AppTextField(
                          labelText: "Confirm Password",
                          obsecureText: true,
                          textEditingController: confirmPassController,
                        ),
                        Gap(28.h),
                        AppButton(
                          buttonName: "Sign up",
                          ontap: () {
                            print(emailController.text);
                            context.read<SignUpBloc>().add(
                              SignUpButtonPressed(
                                email: emailController.text,
                                password: passController.text.trim(),
                                confirmPassword: confirmPassController.text
                                    .trim(),
                              ),
                            );
                          },
                        ),
                        Gap(56.h),
                        Center(
                          child: Text(
                            "--Or sign up with --",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                        Gap(28.h),
                        googleFbSection(context),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  IconButton backButton() {
    return IconButton.filled(
      style: IconButton.styleFrom(backgroundColor: AppColors.appPrimaryColor),
      onPressed: () {
        context.pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  Row googleFbSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignupIconWidget(
          svgAssetPath: AppAssets.googleLogo,
          ontap: () {
            context.read<SignUpBloc>().add(SignUpWithGooglePressed());
          },
        ),
      ],
    );
  }

  void signUpListener(BuildContext context, SignUpState state) {
    if (state is SignUpSuccess) {
      AppSnackbar.show(
        context: context,
        message: "Congratulations! Your account has been created",
        backgroundColor: AppColors.successSnackBarColor,
      );
      // TODO FIX PROFILEONBOARD THEN NAVIGATE TO NAV SCREEN
      context.goNamed(AppRoutes.profileOnBoardRouteName);
    } else if (state is SignUpFailed) {
      AppSnackbar.show(
        context: context,
        message: state.errorMsg,
        backgroundColor: AppColors.errorSnackBarColor,
      );
    }
  }
}
