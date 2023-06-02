import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/core/service_locator.dart';

extension BuildContextExtensions on BuildContext {
  // internal method for navigating to a route without proxying via the app wrapper that loads all dependencies
  void navTo(String routeName, {Map<String, dynamic>? arguments}) {
    if (arguments == null) {
      go(routeName, extra: {'redirect': false});
      return;
    }
    go(Uri(path: routeName, queryParameters: arguments).toString());
  }

  // continue to the original deep link location after proxying through the app wrapper to load all dependencies first
  void navAfterDependencyLoadRedirect(GoRouterState routerState) {
    var route = routerState.fullPath;
    var params = {...routerState.queryParameters, 'redirect': false};
    serviceLocator<NavigationCubit>().redirectSucceeded();
    go(Uri(path: route, queryParameters: params).toString());
  }
}
