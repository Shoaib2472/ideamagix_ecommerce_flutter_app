import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/env.dart';

Future main() async {
  await Env.init();
  await GetStorage.init();
  await Get.putAsync<ProductService>(() async =>ProductService());
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
        title: Text('Ideamagix'),
      )),
    );
  }
}
