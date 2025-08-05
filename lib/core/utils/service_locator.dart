import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/bloc/sign_up_bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/services/sign_up_auth.dart';
import 'package:earn_watching_ads/features/splashscreen/bloc/splash_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void service_locator() {
  // * SPLASH BLOC REGISTER
  getIt.registerLazySingleton<SplashBloc>(() => SplashBloc());

  //* REGISTER FIREBASEAUTH SERVICE
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // * REGISTER SIGN UP AUTH SERVICE
  getIt.registerLazySingleton<SignUpAuth>(
    () => SignUpAuth(firebaseAuth: getIt<FirebaseAuth>()),
  );

  // * REGISTER SIGN UP BLOC SERVICE
  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(signUpAuth: getIt<SignUpAuth>()),
  );
}
