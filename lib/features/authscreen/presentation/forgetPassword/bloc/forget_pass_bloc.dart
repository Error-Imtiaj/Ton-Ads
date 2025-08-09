import 'package:bloc/bloc.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/forgetPassword/services/forget_pass_services.dart';
import 'package:meta/meta.dart';

part 'forget_pass_event.dart';
part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  final ForgetPassServices forgetPassServices;
  ForgetPassBloc(this.forgetPassServices) : super(ForgetPassInitial()) {
    on<ForgetPassRequest>((event, emit) async {
      emit(ForgetPassLoading());
      try {
        if (event.email.isEmpty) {
          emit(ForgetPassError(errorText: "Email can't be empty"));
          return;
        }
        // * Email validation
        final emailRegex = RegExp(
          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
        );
        if (!emailRegex.hasMatch(event.email)) {
          emit(ForgetPassError(errorText: "Please enter a valid email address"));
          return;
        }
        await forgetPassServices.forgetPassword(event.email);
        emit(ForgetPassLinkSuccess());
      } catch (e) {
        emit(ForgetPassError(errorText: e.toString()));
      }
    });
  }
}
