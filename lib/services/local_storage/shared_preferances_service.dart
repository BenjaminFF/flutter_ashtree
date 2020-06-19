import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceService {
  static final SharedPreferanceService _instance =
      SharedPreferanceService._init();

  static SharedPreferences prefs;

  factory SharedPreferanceService() {
    return _instance;
  }

  SharedPreferanceService._init() {
    
  }

  Future<int> getCounter() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Counter');
  }

  Future<void> setCounter(int counter) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.setInt('Counter', counter);
  }

  Future<void> setSession(List<String> session) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('Session', session);
  }

  Future<List<String>> getSession() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('Session');
  }
}
