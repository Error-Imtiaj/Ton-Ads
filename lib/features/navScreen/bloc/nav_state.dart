part of 'nav_bloc.dart';

@immutable
sealed class NavState {
  final int selectedIndex;
  const NavState(this.selectedIndex);
}

final class NavInitial extends NavState {
  const NavInitial(super.selectedIndex);
}
