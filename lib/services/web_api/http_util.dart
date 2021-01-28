import 'dart:io';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    options.baseUrl = 'http://192.168.3.1:8360/api';
    options.connectTimeout = 3 * 1000;
    options.receiveTimeout = 3 * 1000;

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
      switch (e.error.code) {
        case 405:
          SharedPreferanceService().setSession('');
          break;
        default:
          Fluttertoast.showMToast(
            msg: e.error.message,
            toastType: ToastType.ERROR,
          );
      }
    } else {
      // print('DioError');
      print(e.message);
      Fluttertoast.showMToast(
        msg: e.message,
        toastType: ToastType.ERROR,
      );
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
