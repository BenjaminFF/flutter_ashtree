import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferanceService {
  static final SharedPreferanceService _instance =
      SharedPreferanceService._init();

  static SharedPreferences prefs;

  factory SharedPreferanceService() {
    return _instance;
  }

  SharedPreferanceService._init() {}

  List keys = ['CacheItems'];

  Future<void> setSession(String session) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('Session', session);
  }

  Future getSession() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('Session') ?? '';
  }

  // 只适用String类型
  Future<void> setItem({String key, var value, String type}) async {
    if (keys.indexOf(key) == -1) {
      print('no such a key');
      return;
    }
    prefs = await SharedPreferences.getInstance();
    switch (type) {
      case 'Bool':
        prefs.setBool(key, value);
        break;
      case 'Double':
        prefs.setDouble(key, value);
        break;
      case 'Int':
        prefs.setInt(key, value);
        break;
      case 'String':
        prefs.setString(key, value);
        break;
      case 'StringList':
        prefs.setStringList(key, value);
        break;
      default:
        prefs.setString(key, value);
    }
  }

  // 只适用String类型
  Future getItem({String key, String type}) async {
    prefs = await SharedPreferences.getInstance();
    switch (type) {
      case 'Bool':
        return prefs.getBool(key);
      case 'Double':
        return prefs.getDouble(key);
      case 'Int':
        return prefs.getInt(key);
      case 'String':
        return prefs.getString(key) ?? "";
      case 'StringList':
        return prefs.getStringList(key);
      default:
        return prefs.getString(key) ?? "";
    }
  }
}
