import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/core/widgets/app_text.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:earn_watching_ads/core/widgets/appbar_widget.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/balance.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/confirm_exit_dialogue.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/watch_ads_tile.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/weekly_coin_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        
        if (state is HomeLogOutState) {
          context.goNamed(AppRoutes.loginRouteName);
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            // Show confirmation dialog
            bool shouldExit = await ConfirmExitDialog.show(context);
            if (shouldExit) {
              // Exit the app
              SystemNavigator.pop();
            }
          },
          child: Scaffold(
            appBar: AppbarWidget(
              title: "Mohammad Imtiaj Hossen",
              welcomeText: "Welcome Back",
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConst.scaffoldPadding.r,
              ),
              child: (state is HomeLoadingState)
                  ? Loading()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(24.h),
                          Balance(),
                          Gap(24.h),
                          AppText(text: "Statistics", fontSize: 14.r),
                          WeeklyCoinChart(),
                          Gap(24.h),
                          _availableTask(),
                          Divider(color: AppColors.appPrimaryColor),
                          Gap(16.h),
                          WatchAdsTile(
                            title: "Reward Ads",
                            tileColor: AppColors.goldenColor,
                            onTap: () {
                              // todo CLICK TO WATCH ADS
                            },
                          ),
                          Gap(12.h),
                          WatchAdsTile(
                            title: "Reward Ads2",
                            tileColor: AppColors.appbarBackgroundColor,
                            onTap: () {
                              // todo CLICK TO WATCH ADS
                            },
                          ),
                          Gap(12.h),
                          WatchAdsTile(
                            title: "Reward Ads3",
                            tileColor: AppColors.orangeColor,
                            onTap: () {
                              // todo CLICK TO WATCH ADS
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _availableTask() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: "Available Tasks"),
        Icon(Icons.flutter_dash_rounded),
      ],
    );
  }
}
