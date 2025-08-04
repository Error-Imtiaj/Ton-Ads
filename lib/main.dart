import 'package:earn_watching_ads/app.dart';
import 'package:earn_watching_ads/core/utils/app_bloc_observer.dart';
import 'package:earn_watching_ads/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // FIREBASE INITIALIZE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // BLOC OBSERVER
  Bloc.observer = AppBlocObserver();

  // RUN APP
  runApp(EarnApp());
}
