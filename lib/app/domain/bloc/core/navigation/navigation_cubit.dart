import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.events, 2));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.groups:
        emit(NavigationState(NavbarItem.groups, 0));
        break;
      case NavbarItem.matching:
        emit(NavigationState(NavbarItem.matching, 1));
        break;
      case NavbarItem.events:
        emit(NavigationState(NavbarItem.events, 2));
        break;
      case NavbarItem.messages:
        emit(NavigationState(NavbarItem.messages, 3));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}
