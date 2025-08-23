part of 'nav_bloc.dart';

@immutable
sealed class NavEvent {}

final class NavigationDestinationButtonClicked extends NavEvent {
  final int newIndex;
  NavigationDestinationButtonClicked(this.newIndex);
}
