import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/bloc/login_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/services/login_services.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/bloc/sign_up_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/services/sign_up_auth.dart';
import 'package:earn_watching_ads/features/homeScreen/SERVICES/log_out_services.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:earn_watching_ads/features/splashscreen/bloc/splash_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void service_locator() {
  // ? CORE
  //* REGISTER FIREBASEAUTH SERVICE
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // * ==========================================================

  //? REPO
  // * REGISTER SIGN UP SERVICE
  getIt.registerLazySingleton<SignUpAuth>(
    () => SignUpAuth(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * REGISTER LOGIN SERVICE
  getIt.registerLazySingleton<LoginServices>(
    () => LoginServices(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * LOG OUT SERVICE
  getIt.registerLazySingleton<LogOutServices>(
    () => LogOutServices(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * ==========================================================

  // ? BLOCS
  // * SPLASH BLOC REGISTER
  getIt.registerLazySingleton<SplashBloc>(
    () => SplashBloc(getIt<FirebaseAuth>()),
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
