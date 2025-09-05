import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? welcomeText;
  final String? title;
  const AppbarWidget({super.key, this.welcomeText, this.title});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLogOutState) {
          context.goNamed(AppRoutes.loginRouteName);
        }
      },
      child: AppBar(
        backgroundColor: AppColors.appbarBackgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (welcomeText == null)
                ? SizedBox()
                : AppText(text: welcomeText!, fontSize: 14.r),
            AppText(
              text: title!,
              fontSize: 18.r,
              onTap: () {
                // TODO REDIRCET TO PROFILE SCREEN TO CHECK OR UPDATE PROFILE
              },
              textColor: AppColors.appPrimaryTextColor,
            ),
          ],
        ),
        actionsPadding: EdgeInsets.symmetric(
          horizontal: AppConst.scaffoldPadding,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(HomeLogOutEvent());
            },
            icon: Icon(Icons.logout, color: AppColors.appAppbarButtonColor),
          ),
        ],
      ),
    );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(70.h);
}
