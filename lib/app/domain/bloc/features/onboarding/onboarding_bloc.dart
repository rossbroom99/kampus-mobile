import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_event.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_state.dart';
import 'package:kampus/app/domain/usecases/get_first_load_usecase.dart';
import 'package:kampus/core/service_locator.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingUninitialized()) {
    on((event, emit) {
      if (event is AppStarted) {
        _appStarted();
      } else if (event is OnboardingStarted) {
        emit(OnboardingInProgress());
      } else if (event is OnboardingCompleted) {
        emit(OnboardingComplete());
      }
    });
  }

  _appStarted() async {
    // add(OnboardingCompleted());
    // return;
    var isFirstLoad = await serviceLocator<GetFirstLoadUseCase>().call();
    if (isFirstLoad) {
      add(OnboardingStarted());
    } else {
      add(OnboardingCompleted());
    }
  }
}
