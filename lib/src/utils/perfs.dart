import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  SharedPreferences preferences;

  Future<bool> displayShowcase() async {
    preferences = await SharedPreferences.getInstance();
    bool showShowcase = preferences.getBool("showShowcase");
    if (showShowcase != null) {
      if (showShowcase) return true;
    } else {
      final status = await preferences.setBool("showShowcase", true);
      return status;
    }
    return false;
  }
}
