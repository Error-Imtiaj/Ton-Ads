import 'package:earn_watching_ads/features/profileOnboard/data/repo/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:earn_watching_ads/features/profileOnboard/data/model/user_model.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final UserRepo userRepo;

  OnboardBloc({required this.userRepo}) : super(const OnboardState(step: 0)) {
    // Move to next step
    on<NextStepEvent>((event, emit) {
      if (state.step < 3) {
        emit(state.copyWith(step: state.step + 1));
      }
    });

    on<ResetStepEvent>((event, emit) {
      emit(state.copyWith(step: 0, status: OnboardStatus.initial));
    });

    // Register user/profile data
    on<RegisterProfileData>((event, emit) async {
      emit(state.copyWith(status: OnboardStatus.loading));

      try {
        await userRepo.userDataProvider.addOrUpdatePerson(event.userModel);
        emit(state.copyWith(status: OnboardStatus.success));
      } catch (e) {
        emit(
          state.copyWith(
            status: OnboardStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
