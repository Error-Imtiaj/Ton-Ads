import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/bloc/forget_pass_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_logo.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/app_snackbar.dart';
import 'package:earn_watching_ads/core/widgets/app_text_field.dart';
import 'package:earn_watching_ads/core/widgets/app_button.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/auth_page_title.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPassBloc, ForgetPassState>(
      listener: (context, state) {
        if (state is ForgetPassLinkSuccess) {
          AppSnackbar.show(
            context: context,
            message: "Reset email has been sent",
            backgroundColor: AppColors.successSnackBarColor,
          );
        }

        if (state is ForgetPassError) {
          AppSnackbar.show(
            context: context,
            message: state.errorText,
            backgroundColor: AppColors.errorSnackBarColor,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.authPagesScaffoldBackColor,
          body: Padding(
            padding: EdgeInsets.all(AppConst.scaffoldPadding),

            child: (state is ForgetPassLoading)
                ? Center(child: Loading())
                : SingleChildScrollView(
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
                        AppButton(
                          buttonName: "Reset link",
                          ontap: () {
                            context.read<ForgetPassBloc>().add(
                              ForgetPassRequest(
                                email: emailController.text.trim(),
                              ),
                            );
                            emailController.clear();
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
