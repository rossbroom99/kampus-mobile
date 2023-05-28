import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.events, 2));

  void navBarItemIndexChanged(int index) {
    switch (index) {
      case 0:
        emit(NavigationState(NavbarItem.groups, 0));
        break;
      case 1:
        emit(NavigationState(NavbarItem.matching, 1));
        break;
      case 2:
        emit(NavigationState(NavbarItem.events, 2));
        break;
      case 3:
        emit(NavigationState(NavbarItem.messages, 3));
        break;
      case 4:
        emit(NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}
