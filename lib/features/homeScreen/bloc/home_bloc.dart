import 'package:bloc/bloc.dart';
import 'package:earn_watching_ads/features/homeScreen/SERVICES/log_out_services.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LogOutServices logOutServices;
  HomeBloc(this.logOutServices) : super(HomeInitial()) {
    on<HomeLogOutEvent>((event, emit) async {
      emit(HomeLoadingState());
      await logOutServices.logOutReq();
      emit(HomeLogOutState());
    });
  }
}
