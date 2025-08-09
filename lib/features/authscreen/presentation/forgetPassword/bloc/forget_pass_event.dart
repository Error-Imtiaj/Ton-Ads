part of 'forget_pass_bloc.dart';

@immutable
sealed class ForgetPassEvent {}

final class ForgetPassRequest extends ForgetPassEvent {
  final String email;
  ForgetPassRequest({required this.email});
}
