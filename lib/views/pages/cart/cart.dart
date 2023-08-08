import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/controllers/cart.controller.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/Product.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartService cartService = Get.find<CartService>();
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() {
        print(cartController.items);

        if (cartController.items.length == 0) {
          return Center(child: Text('No items in cart'));
        }

        return ListView.builder(
          itemCount: cartController.items.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.items[index];

            return ListTile(
              title: Text(
                cartItem.product.title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              trailing: Text('Qty: ${cartItem.quantity}'),
            );
          },
        );
      }),
      floatingActionButton: Obx(() => FloatingActionButton.extended(
            onPressed: cartController.items.length == 0
                ? null
                : () {
                    cartController.clear();

                    Get.offNamed('/checkout');
                },
            disabledElevation: 0,
            label: Text('Checkout'),
            backgroundColor: cartController.items.length == 0 ? Colors.grey : Colors.red,
          )),
    );
  }
}
