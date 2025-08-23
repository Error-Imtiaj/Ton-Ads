part of 'onboard_bloc.dart';

enum OnboardStatus { initial, loading, success, error }

class OnboardState {
  final int step;
  final OnboardStatus status;
  final String? errorMessage;

  const OnboardState({
    required this.step,
    this.status = OnboardStatus.initial,
    this.errorMessage,
  });

  OnboardState copyWith({
    int? step,
    OnboardStatus? status,
    String? errorMessage,
  }) {
    return OnboardState(
      step: step ?? this.step,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
