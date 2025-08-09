part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
  final String confirmPassword;

  SignUpButtonPressed({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

final class SignUpWithGooglePressed extends SignUpEvent {}