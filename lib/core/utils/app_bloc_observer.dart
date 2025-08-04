import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  static const String bold = '\x1B[1m';
  static const String blue = '\x1B[34m';
  static const String green = '\x1B[32m';
  static const String red = '\x1B[31m';
  static const String yellow = '\x1B[33m';
  static const String reset = '\x1B[0m';

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print(
      '$bold$yellow[BLoC Created]$reset '
      '${bloc.runtimeType}',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(
      '$bold$yellow[BLoC Change]$reset '
      '$green Bloc: ${bloc.runtimeType}, '
      'Current: ${change.currentState}, '
      'Next: ${change.nextState}$reset',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
      '$bold$blue[BLoC Transition]$reset '
      '$green Bloc: ${bloc.runtimeType}, '
      'Event: ${transition.event}, '
      'Current: ${transition.currentState}, '
      'Next: ${transition.nextState}$reset',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(
      '$bold$red[BLoC Error]$reset '
      '$green Bloc: ${bloc.runtimeType}, '
      'Error: $error$reset',
    );
  }
}
