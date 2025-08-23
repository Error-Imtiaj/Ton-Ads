import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_assets.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_snackbar.dart';
import 'package:earn_watching_ads/core/widgets/app_text_field.dart';
import 'package:earn_watching_ads/core/widgets/app_button.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/redirect_from_login.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/signup_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // ? FOR LOGIN FAILED
        if (state is LoginFailed) {
          AppSnackbar.show(
            context: context,
            message: state.message,
            backgroundColor: AppColors.errorSnackBarColor,
          );
        }
        // ? FOR LOGIN SUCCESS

        if (state is LoginSuccess) {
          AppSnackbar.show(
            context: context,
            message: "You have successfully logged in",
            backgroundColor: AppColors.successSnackBarColor,
          );
          context.goNamed(AppRoutes.navScreenRouteName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.authPagesScaffoldBackColor,
          body: Padding(
            padding: EdgeInsets.all(AppConst.scaffoldPadding.r),
            child: (state is LoginLoading)
                ? Loading()
                : SingleChildScrollView(
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
                        ),
                        Gap(28.h),
                        AppButton(
                          buttonName: "Sign in",
                          ontap: () {
                            context.read<LoginBloc>().add(
                              LoginRequested(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                              ),
                            );
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
                            // SignupIconWidget(
                            //   svgAssetPath: AppAssets.fbLogo,
                            //   ontap: () {
                            //     context.read<LoginBloc>().add(
                            //       LoginWithFacebook(),
                            //     );
                            //   },
                            // ),
                            // Gap(24.w),
                            SignupIconWidget(
                              svgAssetPath: AppAssets.googleLogo,
                              ontap: () {
                                context.read<LoginBloc>().add(
                                  LoginWithGoogle(),
                                );
                              },
                            ),
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

                          // 👉 Navigate to register page
                          ontap: () {
                            try {
                              context.pushNamed(AppRoutes.forgetRouteName);
                            } catch (e) {
                              debugPrint("Navigation error: $e");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
