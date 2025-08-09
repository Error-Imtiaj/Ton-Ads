import 'package:bloc/bloc.dart';
import 'package:earn_watching_ads/core/utils/auth_exception.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/signupScreen/services/sign_up_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpAuth signUpAuth;
  SignUpBloc({required this.signUpAuth}) : super(SignUpInitial()) {
    on<SignUpButtonPressed>((event, emit) async {
      // EMAIL VALIDATION
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      );
      if (!emailRegex.hasMatch(event.email)) {
        emit(SignUpFailed(errorMsg: "Please enter a valid email address"));
        return;
      }
      // ALL FIELD CHECK
      if (event.email.isEmpty ||
          event.password.isEmpty ||
          event.confirmPassword.isEmpty) {
        emit(SignUpFailed(errorMsg: "Please fill all fields"));
        return;
      }
      // PASSWORD CHECK
      if (event.password != event.confirmPassword) {
        emit(SignUpFailed(errorMsg: "Passwords do not match"));
        return;
      }
      emit(SignUpLoading());
      try {
        await signUpAuth.signUpUsingEmail(event.email, event.password);
        emit(SignUpSuccess());
      } on FirebaseAuthException catch (e) {
        String errorMessage = AuthException.signupExceptionMsg(e);
        emit(SignUpFailed(errorMsg: errorMessage));
      } catch (e) {
        emit(SignUpFailed(errorMsg: e.toString()));
      }
    });

    on<SignUpWithGooglePressed>((event, emit) async {
       emit(SignUpLoading());
      try {
        await signUpAuth.signInWithGoogle();
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailed(errorMsg: e.toString()));
      }
    });
  }
}
