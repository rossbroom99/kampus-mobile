import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_event.dart';
import 'package:kampus/app/domain/bloc/core/app/app_state.dart';
import 'package:kampus/app/domain/bloc/core/app/initial_page.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_bloc.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_state.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_bloc.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_state.dart';
import 'package:kampus/core/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppLoading()) {
    _handleEvents();
    _subscribeToAppInitializationDependencies();
  }

  _handleEvents() {
    on((event, emit) {
      if (event is AppStarted) {
        emit(AppLoading());
      } else if (event is AppInitialized) {
        emit(AppReady(event.initialPage));
      }
    });
  }

  _subscribeToAppInitializationDependencies() {
    CombineLatestStream.combine2(
      serviceLocator<OnboardingBloc>().stream,
      serviceLocator<AuthenticationBloc>().stream,
      (onboardingState, authenticationState) =>
          (onboardingState, authenticationState),
    ).listen((states) {
      if (states.$1 is OnboardingUninitialized ||
          states.$2 is AuthenticationLoading) {
        add(AppStarted());
        return;
      }
      if (states.$1 is OnboardingInProgress) {
        add(AppInitialized(InitialPage.onboarding));
        return;
      }
      if (states.$2 is AuthenticationUnauthenticated) {
        add(AppInitialized(InitialPage.login));
        return;
      }
    });
  }
}
