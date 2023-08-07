import 'dart:convert';

import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/fetch.dart';

class CrudService extends GetxService{
  CrudService({
 required basePath,
  });
  final Fetch _fetch = Fetch();
  final String _basePath = '/products';
  Future<dynamic> getMany({Map<String, String>? queryParamters}) async {
    String? response = await _fetch.get(path: _basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }
  Future<dynamic> getOne(String id,{Map<String, String>? queryParamters}) async {
    String? response = await _fetch.get(path: _basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }
}
