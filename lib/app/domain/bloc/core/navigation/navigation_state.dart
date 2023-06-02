part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  final GoRouterState? redirectState;

  const NavigationState(this.navbarItem, this.index, this.redirectState);

  @override
  List<Object> get props => [navbarItem, index];
}
