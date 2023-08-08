import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Checkout')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check, color: Colors.green, size: 100),
          SizedBox(height: 50),
          Text('Order Successful'),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/products');
              },
              child: Text('Home'))
        ],
      )),
    );
  }
}
