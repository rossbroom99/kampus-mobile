import 'package:shared_preferences/shared_preferences.dart';

class GetFirstLoadUseCase {
  Future<bool> call() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_run') ?? true;
  }
}
