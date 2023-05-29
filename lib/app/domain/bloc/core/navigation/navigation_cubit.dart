import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_flavorizr/parser/models/config/app.dart';
import 'package:kampus/app/domain/bloc/core/app/app_bloc.dart';

import 'nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  static NavigationState initialNavItem =
      const NavigationState(NavbarItem.events, 2);
  NavigationCubit() : super(initialNavItem);

  void navBarItemIndexChanged(int index) {
    switch (index) {
      case 0:
        emit(const NavigationState(NavbarItem.groups, 0));
        break;
      case 1:
        emit(const NavigationState(NavbarItem.matching, 1));
        break;
      case 2:
        emit(const NavigationState(NavbarItem.events, 2));
        break;
      case 3:
        emit(const NavigationState(NavbarItem.messages, 3));
        break;
      case 4:
        emit(const NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}
