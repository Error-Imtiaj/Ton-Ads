import 'package:earn_watching_ads/core/themes/app_theme.dart';
import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/core/utils/service_locator.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/bloc/forget_pass_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/bloc/sign_up_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/screens/app_create_account.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/screens/app_login.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/screens/forget_password.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/screens/home_screen.dart';
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
          providers: [
            BlocProvider(create: (context) => getIt<SplashBloc>()),
            BlocProvider(create: (context) => getIt<SignUpBloc>()),
            BlocProvider(create: (context) => getIt<LoginBloc>()),
            BlocProvider(create: (context) => getIt<HomeBloc>()),
            BlocProvider(create: (context) => getIt<ForgetPassBloc>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Earn Money",
            routerConfig: _router,
            theme: AppTheme.lightTheme(context),
          ),
        );
      },
    );
  }

  //? GO ROUTE CONFIG

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.initialRoutePath,
    routes: [
      // Splash Screen
      GoRoute(
        path: AppRoutes.initialRoutePath,
        builder: (context, state) => const SplashScreen(),
      ),

      // Login
      GoRoute(
        path: AppRoutes.loginRoutePath,
        name: AppRoutes.loginRouteName,
        builder: (context, state) => const AppLogin(),
      ),

      // Sign Up (top-level)
      GoRoute(
        path: '/${AppRoutes.signUpRoutePath}',
        name: AppRoutes.signUpRouteName,
        builder: (context, state) => const AppCreateAccount(),
      ),

      // Forget Password (top-level)
      GoRoute(
        path: '/${AppRoutes.forgetRoutePath}',
        name: AppRoutes.forgetRouteName,
        builder: (context, state) => const ForgetPassword(),
      ),

      // Home
      GoRoute(
        path: AppRoutes.homeRoutePath,
        name: AppRoutes.homeRouteName,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
