import 'package:kampus/app/domain/bloc/core/app/initial_page.dart';

sealed class AppEvent {}

class AppStarted extends AppEvent {}

class AppInitialized extends AppEvent {
  final InitialPage initialPage;
  AppInitialized(this.initialPage);
}
