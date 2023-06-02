import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_bloc.dart';
import 'package:kampus/app/domain/bloc/core/app/app_state.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_bloc.dart';
import 'package:kampus/app/domain/bloc/core/auth/authentication_state.dart';
import 'package:kampus/app/domain/bloc/core/navigation/nav_bar_items.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';

import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_bloc.dart';
import 'package:kampus/app/domain/bloc/features/onboarding/onboarding_state.dart';
import 'package:kampus/app/presentation/core/navigation/root_screen.dart';
import 'package:kampus/core/extensions/build_context_extensions.dart';
import 'package:kampus/core/service_locator.dart';

class AppWrapper extends StatefulWidget {
  late NavbarItem targetTab;

  AppWrapper({super.key, required this.targetTab});

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
              return MultiBlocListener(
                listeners: [
                  BlocListener<OnboardingBloc, OnboardingState>(
                    listener: (context, state) {
                      if (state is OnboardingUninitialized) {
                        context.navTo('/onboarding');
                      }
                    },
                  ),
                  BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      if (state is AuthenticationUnauthenticated) {
                        context.navTo('/login');
                      }
                    },
                  ),
                  BlocListener<NavigationCubit, NavigationState>(
                    listener: (context, state) {
                      if (state.redirectState != null) {
                        context.navAfterDependencyLoadRedirect(
                            state.redirectState!);
                      }
                    },
                  ),
                ],
                child: RootScreen(
                  targetTab: widget.targetTab,
                ),
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
