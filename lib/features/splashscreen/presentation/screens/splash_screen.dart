import 'package:earn_watching_ads/core/utils/app_assets.dart';
import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/splashscreen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashBloc>().add(SplashNavigateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateToHome) {
          context.go(AppRoutes.loginRoutePath);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.splashScreenBackgroundColor,
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: SvgPicture.asset(
              AppAssets.appLogoPath,
              width: 200.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
