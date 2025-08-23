part of 'onboard_bloc.dart';

abstract class OnboardEvent {}

class NextStepEvent extends OnboardEvent {}
// In OnboardBloc
class ResetStepEvent extends OnboardEvent {}


class RegisterProfileData extends OnboardEvent {
  final UserModel userModel;
  RegisterProfileData({required this.userModel});
}
