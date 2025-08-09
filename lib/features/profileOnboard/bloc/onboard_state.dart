part of 'onboard_bloc.dart';

class OnboardState {
  final int step;
  const OnboardState({required this.step});

  OnboardState copyWith({int? step}) {
    return OnboardState(step: step ?? this.step);
  }
}
