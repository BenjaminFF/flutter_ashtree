import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceService {
  static final SharedPreferanceService _instance =
      SharedPreferanceService._init();

  static SharedPreferences prefs;

  factory SharedPreferanceService() {
    return _instance;
  }

  SharedPreferanceService._init() {}

  Future<int> getCounter() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Counter');
  }

  Future<void> setCounter(int counter) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.setInt('Counter', counter);
  }

  Future<void> setSession(String session) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.setString('Session', session);
  }

  Future<String> getSession() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('Session') ?? '';
  }
}
