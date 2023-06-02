import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kampus/app/domain/bloc/core/app/app_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_state.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_bloc.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_state.dart';
import 'package:kampus/app/domain/bloc/core/navigation/nav_bar_items.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_bloc.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_state.dart';
import 'package:kampus/app/presentation/app_wrapper.dart';
import 'package:kampus/app/presentation/features/login/login_screen.dart';
import 'package:kampus/app/presentation/features/onboarding/onboarding_screen.dart';
import 'package:kampus/core/extensions/build_context_extensions.dart';
import 'package:kampus/core/service_locator.dart';

T? cast<T>(x) => x is T ? x : null;

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    redirect: navigationMiddleware,
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
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );

  AppRouter() {
    _subscribeToAppStatus();
  }

// ignore: prefer_function_declarations_over_variables
  static final navigationMiddleware =
      (BuildContext context, GoRouterState state) {
    switch (state.location) {
      case '/':
        return null;
      case '/groups':
        return null;
      case '/matching':
        return null;
      case '/events':
        return null;
      case '/messages':
        return null;
      case '/profile':
        return null;
      default:
        break;
    }
    if (state.extra != null) {
      var data = cast<Map<String, dynamic>>(state.extra);
      if (data != null) {
        if (data['redirect'] != null && data['redirect'] == false) {
          return null;
        }
      }
    }
    serviceLocator<NavigationCubit>().redirectViaAppWrapper(state);
    return '/';
  };

  void _subscribeToAppStatus() async {
    serviceLocator<AppBloc>().stream.listen((state) {
      if (state is AppReady) {
        var shouldStartOnboarding =
            serviceLocator<OnboardingBloc>().state is OnboardingInProgress;
        if (shouldStartOnboarding) {
          navigatorKey.currentState?.context.navTo('/onboarding');
        }
        var shouldRedirectToLogin = serviceLocator<AuthenticationBloc>().state
            is AuthenticationUnauthenticated;
        if (shouldRedirectToLogin) {
          //navigatorKey.currentState?.context.navTo('/login');
        }
      }
    });
  }
}
