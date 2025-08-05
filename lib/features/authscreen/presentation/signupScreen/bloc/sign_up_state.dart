part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final String errorMsg;

  SignUpFailed({required this.errorMsg});

}

final class SignUpSuccess extends SignUpState {}
