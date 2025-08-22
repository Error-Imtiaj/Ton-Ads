import 'package:earn_watching_ads/core/themes/app_const.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/appbar_widget.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/widgets/balance.dart';
import 'package:flutter/material.dart';
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
        // TODO: implement listener
        if (state is HomeLogOutState) {
          context.goNamed(AppRoutes.loginRouteName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppbarWidget(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConst.scaffoldPadding),
            child: (state is HomeLoadingState)
                ? Loading()
                : Column(children: [Gap(24.h), Balance()]),
          ),
        );
      },
    );
  }
}
