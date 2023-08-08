import 'package:ideamagix_ecommerce_flutter_app/services/crud.service.dart';

class ProductService extends CrudService {
  ProductService() : super(basePath: '/products');
}

class CartService extends CrudService {
  CartService() : super(basePath: '/carts');
}
