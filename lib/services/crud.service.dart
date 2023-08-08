import 'dart:convert';

import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/fetch.dart';

class CrudService extends GetxService {
  late String basePath;
  CrudService({
    required path,
  }) {
    basePath = path;
  }

  final Fetch fetch = Fetch(); //instance of Fetch
  Future<dynamic> getMany({Map<String, String>? queryParamters}) async {
    //it takes query param
    String? response = await fetch.get(path: basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    print(response);
    return jsonDecode(response);
  }

  Future<dynamic> getOne(String id, {Map<String, String>? queryParamters}) async {
    String? response = await fetch.get(path: basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }

  Future<dynamic> postOne(Map<String, dynamic> data, {Map<String, String>? queryParamters}) async {
    String? response = await fetch.post(data: data, path: basePath, queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }
}
