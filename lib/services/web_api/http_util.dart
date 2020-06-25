import 'dart:io';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class BusinessError implements Exception {
  int code;
  String message;
  BusinessError({this.code, this.message});
}

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._init();
  static Dio _dio;

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._init() {
    _dio = new Dio();
    BaseOptions options = BaseOptions();
    options.baseUrl = 'http://10.0.2.2:8360/api';
    options.connectTimeout = 2 * 1000;
    options.receiveTimeout = 2 * 1000;
    // options.contentType =
    //     ContentType.parse('application/x-www-form-urlencoded') as String;

    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;

    _dio.options = options;

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String session = await SharedPreferanceService().getSession();
      if (session.isNotEmpty) {
        options.headers['cookie'] = session;
      }
      return options;
    }, onResponse: (Response response) async {
      if (response.data['errno'] == 0) {
        print(response.data);
        return response;
      } else {
        throw new BusinessError(
          code: response.data['errno'],
          message: response.data['errmsg'],
        );
      }
    }, onError: (DioError e) async {
      handleError(e);
    }));
  }

  handleError(DioError e) {
    if (e.error is BusinessError) {
      print('BusinessError');
      print(e.error.message);
    } else {
      print('DioError');
      print(e.message);
    }
  }

  Future<Response<dynamic>> get(
      url, Map<String, dynamic> queryParameters) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }

  Future<Response<dynamic>> post(url, Map<String, dynamic> data) async {
    return await _dio.post(url, data: data);
  }
}
