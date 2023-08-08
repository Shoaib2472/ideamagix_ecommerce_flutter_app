import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/controllers/auth.controller.dart';
import 'package:ideamagix_ecommerce_flutter_app/controllers/product.controller.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/CartItem.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';

class CartController extends GetxController {
  List<CartItem> items = RxList();
  CartService cartService = Get.find<CartService>();
  final ProductController productController = Get.put(ProductController());
  final AuthController authController = Get.put(AuthController());

  onInit() async {
    super.onInit();

    print('hi');

    await loadData();
  }

  clear() {
    // TODO: API Call to empty cart
    items.clear();
  }

  loadData() async {
    List<dynamic>? cartResponse = await cartService.getUserCart(authController.authUserId) ?? [];

    items.clear();

    for (var cartItemJson in cartResponse?[0]['products'] ?? []) {
      print(cartItemJson['productId']);

      var product = productController.products.firstWhere((element) => element.id == cartItemJson['productId']);

      items.add(CartItem(product: product, quantity: cartItemJson['quantity']));
    }
  }

  Future<List<CartItem>> getMany() async {
    return items;
  }
}
