import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/core/bloc_observer.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);
  // };
  Bloc.observer = GlobalBlocObserver();
  runApp(await builder());
}
