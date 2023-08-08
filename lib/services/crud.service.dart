import 'dart:convert';

import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/fetch.dart';

class CrudService extends GetxService {
  late String _basePath;
  CrudService({
    required basePath,
  }) {
    _basePath = basePath;
  }
  final Fetch _fetch = Fetch(); //instance of Fetch
  Future<dynamic> getMany({Map<String, String>? queryParamters}) async {
    //it takes query param
    String? response = await _fetch.get(path: _basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }

  Future<dynamic> getOne(String id, {Map<String, String>? queryParamters}) async {
    String? response = await _fetch.get(path: _basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }
   Future<dynamic> postOne(Map<String,dynamic> data,{Map<String, String>? queryParamters}) async {
    String? response = await _fetch.post(data:data, path: _basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }
}
