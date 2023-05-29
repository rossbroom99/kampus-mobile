import 'package:go_router/go_router.dart';
import 'package:kampus/app/domain/bloc/core/navigation/nav_bar_items.dart';
import 'package:kampus/app/presentation/app_wrapper.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.events,
      ),
    ),
    GoRoute(
      path: '/events',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.events,
      ),
    ),
    GoRoute(
      path: '/groups',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.groups,
      ),
    ),
    GoRoute(
      path: '/matching',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.matching,
      ),
    ),
    GoRoute(
      path: '/messages',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.messages,
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => AppWrapper(
        targetTab: NavbarItem.profile,
      ),
    ),
  ],
);
