import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kampus/app/presentation/app_wrapper.dart';
import 'package:kampus/app/presentation/core/navigation/root_screen.dart';

final router = GoRouter(
  initialLocation: RootScreen.route,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppWrapper(),
    ),
  ],
);
