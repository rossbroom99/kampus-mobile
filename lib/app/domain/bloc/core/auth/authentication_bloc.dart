import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_event.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_state.dart';
import 'package:kampus/app/domain/usecases/get_auth_status_usecase.dart';
import 'package:kampus/core/service_locator.dart';

class AuthenticationBloc extends Bloc<AuthenticatioEvent, AuthenticationState> {
  late GetAuthStatusUseCase _getAuthStatusUseCase;

  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    _getAuthStatusUseCase = serviceLocator<GetAuthStatusUseCase>();
    _handleEvents();
  }

  _handleEvents() {
    on((event, emit) async {
      if (event is AppStarted) {
        await _appStarted(emit);
      }
    });
  }

  _appStarted(Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await _authCheckStarted(emit);
  }

  _authCheckStarted(Emitter<AuthenticationState> emit) async {
    var isAuth = await _getAuthStatusUseCase();
    if (isAuth) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }
}
