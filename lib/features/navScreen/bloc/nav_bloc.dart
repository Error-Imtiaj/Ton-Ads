import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavInitial(0)) {
    on<NavigationDestinationButtonClicked>((event, emit) {
      emit(NavInitial(event.newIndex));
    });
  }
}
