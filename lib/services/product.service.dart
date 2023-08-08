import 'package:ideamagix_ecommerce_flutter_app/services/crud.service.dart';
import 'dart:convert';

class ProductService extends CrudService {
  ProductService() : super(path: '/products');
}

class CartService extends CrudService {
  CartService() : super(path: '/carts');

  Future<dynamic> getUserCart(id, {Map<String, String>? queryParamters}) async {
    //it takes query param
    // TODO: Fetch User from Auth Controller based on token
    String? response = await super.fetch.get(path: '$basePath/user/$id', queryParamters: queryParamters);
    if (response == null) {
      return null;
    }
    return jsonDecode(response);
  }

  // Future<dynamic> emptyCart({Map<String, String>? queryParamters}) async {
  //   //it takes query param
  //   String? response = await super.fetch.get(path: '$basePath/user/2', queryParamters: queryParamters);
  //   if (response == null) {
  //     return null;
  //   }
  //   return jsonDecode(response);
  // }
}
