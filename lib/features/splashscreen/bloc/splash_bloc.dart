import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final FirebaseAuth firebaseAuth;
  SplashBloc(this.firebaseAuth) : super(SplashInitial()) {
    on<SplashNavigateEvent>(_onNavigate);
  }

  Future<void> _onNavigate(
    SplashNavigateEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));
    final user = firebaseAuth.currentUser;
    if (user == null) {
      emit(SplashNavigateToLogin());
    } else {
      emit(SplashNavigateToHome());
    }
  }
}
