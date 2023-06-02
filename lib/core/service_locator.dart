import 'package:get_it/get_it.dart';
import 'package:kampus/app/data/datasource/user/auth_local_datasource.dart';
import 'package:kampus/app/data/repository/user_respository.dart';
import 'package:kampus/app/domain/bloc/core/app/app_bloc.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_bloc.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_bloc.dart';
import 'package:kampus/app/domain/repository/i_user_respository.dart';
import 'package:kampus/app/domain/usecases/get_auth_status_usecase.dart';
import 'package:kampus/app/domain/usecases/get_first_load_usecase.dart';
import 'package:kampus/app/domain/usecases/set_first_load_usecase.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_event.dart'
    as onboarding_event;
import 'package:kampus/app/domain/bloc/core/auth/authentication_event.dart';
import 'package:kampus/routes/app_router.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async {
  await registerDataSources();
  await registerRepositories();
  await registerUserCases();
  await registerBlocs();
  await registerServices();
}

Future<void> registerDataSources() async {
  serviceLocator
      .registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
}

Future<void> registerRepositories() async {
  serviceLocator.registerFactory<IUserRepository>(() => UserRepository());
}

Future<void> registerUserCases() async {
  serviceLocator.registerFactory(() => GetFirstLoadUseCase());
  serviceLocator.registerFactory(() => GetAuthStatusUseCase());
  serviceLocator.registerFactory(() => SetFirstLoadUseCase());
}

Future<void> registerServices() async {
  serviceLocator.registerSingleton(AppRouter());
}

Future<void> registerBlocs() async {
  serviceLocator.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc()..add(AppStarted()));
  serviceLocator.registerLazySingleton<AppBloc>(() => AppBloc());
  serviceLocator.registerLazySingleton<OnboardingBloc>(
      () => OnboardingBloc()..add(onboarding_event.AppStarted()));
  serviceLocator.registerLazySingleton(() => NavigationCubit());
}
