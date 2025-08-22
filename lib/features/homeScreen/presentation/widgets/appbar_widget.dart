import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: AppBar(
        backgroundColor: AppColors.appbarBackgroundColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: "Welcome Back", fontSize: 14.sp),
            AppText(
              text: "Mohammad Imtiaj Hossen",
              fontSize: 18.sp,
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
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.h);
}
