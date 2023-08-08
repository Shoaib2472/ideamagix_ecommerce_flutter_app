import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/Product.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartService cartService = Get.find<CartService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: FutureBuilder(
            future: cartService.getMany(queryParamters: {}),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              print(snapshot.data);
              List<dynamic> carts = snapshot.data;
              return ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Product cart = Product.fromJson(carts[index]);
                    return ListTile(
                        leading: Image.network(
                          cart.image,
                          fit: BoxFit.cover,
                        ),
                        trailing: Text(
                          cart.description,
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text(cart.title));
                  });
              // return Column(
              //   children: [
              //     ListView.builder(
              //         itemCount: carts.length,
              //         itemBuilder: (context, index) {
              //           final Product cart = Product.fromJson(carts[index]);
              //           print('Cart' + cart.title);
              //         })
              //   ],
              // );
            }));
  }
}
