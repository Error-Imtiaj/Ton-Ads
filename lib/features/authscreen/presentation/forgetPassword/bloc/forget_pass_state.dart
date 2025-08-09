part of 'forget_pass_bloc.dart';

@immutable
sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoading extends ForgetPassState {}

final class ForgetPassError extends ForgetPassState {
  final String errorText;
  ForgetPassError({required this.errorText});
}

final class ForgetPassLinkSuccess extends ForgetPassState {}
