import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/screens/app_create_account.dart';
import 'package:earn_watching_ads/features/splashscreen/bloc/splash_bloc.dart';
import 'package:earn_watching_ads/features/splashscreen/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EarnApp extends StatelessWidget {
  EarnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 914),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => SplashBloc())],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Earn Money",
            routerConfig: _router,
          ),
        );
      },
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.initialRoutePath,
    routes: [
      GoRoute(
        path: AppRoutes.initialRoutePath,
        builder: (context, state) => const SplashScreen(),
      ),
      // AUTH ROUTES
      GoRoute(
        path: AppRoutes.signUpRoutePath,
        builder: (context, state) => const AppCreateAccount(),
      ),
    ],
  );
}
