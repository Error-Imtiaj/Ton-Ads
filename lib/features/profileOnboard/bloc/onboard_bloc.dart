import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState(step: 0)) {
    on<NextStepEvent>((event, emit) {
      if (state.step < 3) {
        emit(state.copyWith(step: state.step + 1));
      }
    });
  }
}
