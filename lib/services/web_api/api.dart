import 'package:dio/dio.dart';
import './http_util.dart';

class Api {
  static final Api _api = Api._init();

  factory Api() {
    return _api;
  }

  Api._init();

  Future<dynamic> validate() async {
    Response response = await HttpUtil().post('/api/validate', {});
    return response.data;
  }

  Future<dynamic> login(
      int timestamp, String nonce, String email, String password) async {
    Response response = await HttpUtil().post('/user/login', {
      'timestamp': timestamp,
      'nonce': nonce,
      'email': email,
      'password': password
    });
    return response.data;
  }

  Future<dynamic> listSets() async {
    Response response = await HttpUtil().get('/set/list', {});
    return response.data;
  }
}
