import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  static NavigationState initialNavItem =
      const NavigationState(NavbarItem.events, 2, null);
  NavigationCubit() : super(initialNavItem);

  void navBarItemIndexChanged(int index) {
    switch (index) {
      case 0:
        emit(NavigationState(NavbarItem.groups, 0, state.redirectState));
        break;
      case 1:
        emit(NavigationState(NavbarItem.matching, 1, state.redirectState));
        break;
      case 2:
        emit(NavigationState(NavbarItem.events, 2, state.redirectState));
        break;
      case 3:
        emit(NavigationState(NavbarItem.messages, 3, state.redirectState));
        break;
      case 4:
        emit(NavigationState(NavbarItem.profile, 4, state.redirectState));
        break;
    }
  }

  void redirectViaAppWrapper(GoRouterState routerState) {
    emit(NavigationState(state.navbarItem, state.index, routerState));
  }

  void redirectSucceeded() {
    emit(NavigationState(state.navbarItem, state.index, null));
  }
}
