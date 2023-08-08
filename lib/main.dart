import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/constants.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/env.dart';
import 'package:ideamagix_ecommerce_flutter_app/views/pages/cart/cart.dart';
import 'package:ideamagix_ecommerce_flutter_app/views/pages/checkout/checkout.dart';
import 'package:ideamagix_ecommerce_flutter_app/views/pages/home/index.dart';
import 'package:ideamagix_ecommerce_flutter_app/views/pages/login/login.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/auth.service.dart';


Future main() async {
  await Env.init();
  await GetStorage.init();
  await Get.putAsync<ProductService>(() async => ProductService());
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.putAsync<CartService>(() async => CartService());
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: red),
        // primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/products', page: () => const HomePage()),
        GetPage(name: '/cart', page: () => const CartPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/checkout', page: () => const CheckoutPage())
      ],
    );
  }
}
