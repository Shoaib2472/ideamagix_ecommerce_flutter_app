import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/env.dart';

class Fetch {
  final String _apiHost = Env.getString('API_HOST');
  final int _apiPort = Env.getInt('API_PORT');
  final String _apiScheme = Env.getString('API_SCHEME');

  final _dio = Dio();

  _url({required String path, Map<String, String>? queryParamters, Object? data}) {
    return Uri(
            host: _apiHost,
            // port: _apiPort,
            scheme: 'https',
            path: path,
            queryParameters: queryParamters)
        .toString();
  }

  _headers(token) {
    // print(token);
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'content-language': 'en-US',
      'Authorization': 'Bearer $token',
    };
  }

  Future<String?> get({required String path, String? token, Map<String, String>? queryParamters}) async {
    String? response;
    try {
      print('httpResponsein');

      Response httpResponse = await _dio.get(
        _url(path: path, queryParamters: queryParamters),
        options: Options(headers: _headers(token), validateStatus: (status) => status! < 500),
      );

      print('httpResponse');

      if (httpResponse.statusCode == 200) {
        response = jsonEncode(httpResponse.data);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Network Error: $e');
    }

    return response;
  }

  Future<String?> post({
    required String path,
    required Map<String, dynamic> data,
    String? token,
    Map<String, String>? queryParamters,
  }) async {
    String? response;
    try {
      Response httpResponse = await _dio.post(
        _url(path: path, queryParamters: queryParamters),
        data: data,
        options: Options(headers: _headers(token), validateStatus: (status) => status! < 500),
      );
      print(httpResponse.statusCode);
      print('response');
      print(httpResponse);
      print(path);
      if (httpResponse.statusCode == 200) {
        response = jsonEncode(httpResponse.data);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Network Error: $e');
    }
    return response;
  }

  Future<String?> put({
    required String path,
    required Map<String, dynamic> data,
    String? token,
    Map<String, String>? queryParamters,
  }) async {}

  Future<String?> patch({
    required String path,
    required Map<String, dynamic> data,
    String? token,
    Map<String, String>? queryParamters,
  }) async {}

  Future<String?> delete({
    required String path,
    String? token,
    Map<String, String>? queryParamters,
  }) async {}
}
