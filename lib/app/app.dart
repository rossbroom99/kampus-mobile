import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus/app/domain/bloc/core/navigation/navigation_cubit.dart';
import 'package:kampus/app/presentation/theme.dart';
import 'package:kampus/routes/app_router.dart';

class KampusApp extends StatefulWidget {
  const KampusApp({super.key});

  @override
  State<KampusApp> createState() => _KampusAppState();
}

class _KampusAppState extends State<KampusApp> {
  //final router = serviceLocator.get<$AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: KampusTheme.getTheme(context),
          routerConfig: router),
    );
  }
}
