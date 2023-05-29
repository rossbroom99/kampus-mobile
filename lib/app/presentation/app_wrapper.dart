import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_state.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_bloc.dart';

import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_bloc.dart';
import 'package:kampus/app/presentation/core/navigation/root_screen.dart';
import 'package:kampus/core/service_locator.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => serviceLocator<AuthenticationBloc>(),
        ),
        BlocProvider<OnboardingBloc>(
          create: (context) => serviceLocator<OnboardingBloc>(),
        ),
        BlocProvider<AppBloc>(
          create: (context) => serviceLocator<AppBloc>(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AppLoading:
              return const Center(child: CircularProgressIndicator());
            case AppReady:
              return const RootScreen();
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
