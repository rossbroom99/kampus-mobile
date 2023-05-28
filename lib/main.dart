import 'package:flutter/material.dart';
import 'package:kampus/app/app.dart';

import 'core/bootstrap.dart';
import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  //await
  //bootstrap(() => KampusApp());
  runApp(KampusApp());
}
