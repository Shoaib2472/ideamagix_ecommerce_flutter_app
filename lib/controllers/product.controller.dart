import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/Product.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';

class ProductController extends GetxController {
  List<Product> products = RxList();
  RxString sort = 'asc'.obs;

  ProductService productService = Get.find<ProductService>();

  onInit() async {
    super.onInit();

    print('object');

    await getMany();
  }

  sortList($value) async {
    // print($value)
    await getMany(queryParamters: {
      'sort': $value
    });
  }

  Future<List<Product>> getMany({Map<String, String>? queryParamters}) async {
    print('in');
    List<dynamic> responseProducts = await productService.getMany(queryParamters: queryParamters);

    products.clear();
    print('loadData');

    for (var productJson in responseProducts) {
      products.add(Product.fromJson(productJson));
    }

    print(products);
    return products;
  }
}
