import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/bloc/forget_pass_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/services/forget_pass_services.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/services/login_services.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/bloc/sign_up_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/services/sign_up_auth.dart';
import 'package:earn_watching_ads/features/homeScreen/SERVICES/log_out_services.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:earn_watching_ads/features/splashscreen/bloc/splash_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GetIt getIt = GetIt.instance;

void service_locator() {
  // ? CORE ====================================================
  //* REGISTER FIREBASEAUTH SERVICE
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  // * REGISTER GOOGLE SIGN IN
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  // * FACEBOOK AUTH INSTANCE
  getIt.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);

  // * ==========================================================

  //? REPO ======================================================
  // * REGISTER SIGN UP SERVICE
  getIt.registerLazySingleton<SignUpAuth>(
    () => SignUpAuth(firebaseAuth: getIt<FirebaseAuth>(), googleSignIn: getIt<GoogleSignIn>()),
  );

  // * REGISTER LOGIN SERVICE
  getIt.registerLazySingleton<LoginServices>(
    () => LoginServices(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
      facebookAuth: getIt<FacebookAuth>(),
    ),
  );

  // * LOG OUT SERVICE
  getIt.registerLazySingleton<LogOutServices>(
    () => LogOutServices(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * FORGET PASSWORD SERVICE
  getIt.registerLazySingleton<ForgetPassServices>(
    () => ForgetPassServices(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * ==========================================================

  // ? BLOCS
  // * SPLASH BLOC REGISTER
  getIt.registerLazySingleton<SplashBloc>(
    () => SplashBloc(getIt<FirebaseAuth>()),
  );

  // * FORGET PASS BLOC REGISTER
  getIt.registerLazySingleton<ForgetPassBloc>(
    () => ForgetPassBloc(getIt<ForgetPassServices>()),
  );

  // * SIGN UP BLOC REGISTER
  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(signUpAuth: getIt<SignUpAuth>()),
  );

  //* LOGIN BLOC REGISTER
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<LoginServices>()));

  // * HOME BLOC
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt<LogOutServices>()));
}
