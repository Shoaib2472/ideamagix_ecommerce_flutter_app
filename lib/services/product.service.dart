import 'dart:convert';

import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/crud.service.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/fetch.dart';

class ProductService extends CrudService {
  ProductService() : super(basePath: '/products');
}
