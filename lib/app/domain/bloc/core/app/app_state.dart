import 'package:kampus/app/domain/bloc/core/app/initial_page.dart';

sealed class AppState {}

class AppLoading extends AppState {}

class AppReady extends AppState {
  final InitialPage initialPage;
  AppReady(this.initialPage);
}
