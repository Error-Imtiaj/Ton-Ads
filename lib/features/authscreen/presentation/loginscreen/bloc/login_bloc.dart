import 'package:bloc/bloc.dart';
import 'package:earn_watching_ads/core/utils/auth_exception.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/loginscreen/services/login_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginServices loginServices;
  LoginBloc(this.loginServices) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(LoginFailed(message: 'Please fill all the fields'));
      }
      // * Email validation
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
      );
      if (!emailRegex.hasMatch(event.email)) {
        emit(LoginFailed(message: "Please enter a valid email address"));
        return;
      }

      emit(LoginLoading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        String errorMessage = AuthException.loginExecptionMsg(e);
        emit(LoginFailed(message: errorMessage));
      } catch (e) {
        emit(LoginFailed(message: 'Unexpected error occurred.'));
      }
    });
  }
}
