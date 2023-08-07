import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/Product.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService productService = Get.find<ProductService>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))],
      ),
      body: FutureBuilder(
        future: productService.getMany(queryParamters: {
          'sort' : 'asc'
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          print(snapshot.data);

          List<dynamic> products = snapshot.data;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Product product = Product.fromJson(products[index]);

              print(product);
              return SizedBox(
                height: 300,
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 2 / 1,
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                        )),
                    Text(product.title),
                    ElevatedButton(onPressed: () {}, child: Text('Add to cart'))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}