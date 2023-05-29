import 'package:shared_preferences/shared_preferences.dart';

class SetFirstLoadUseCase {
  Future<void> call(bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_run', value);
  }
}
