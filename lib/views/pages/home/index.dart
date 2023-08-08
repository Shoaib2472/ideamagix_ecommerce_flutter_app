import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/models/Product.model.dart';
import 'package:ideamagix_ecommerce_flutter_app/services/product.service.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService productService = Get.find<ProductService>();
  TextEditingController searchQuery = TextEditingController();
  String sort = 'asc';
  List<String> list = <String>[
    'ASC',
    'DES',
  ];
  bool pressed = false;
  String dropdownValue = 'ASC';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: FutureBuilder(
        future: productService.getMany(queryParamters: {
          'sort': sort
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          print(snapshot.data);
          // return Container();

          List<dynamic> products = snapshot.data;

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width10, vertical: height10 * 1.2),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: TextField(
                        controller: searchQuery,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(height10), border: Border.all(color: black)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.filter_alt),
                          elevation: 16,
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              if (value == 'ASC') {
                                sort = 'asc';
                              } else
                                sort = 'desc';
                              dropdownValue = value!;
                            });
                          },
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ))
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final Product product = Product.fromJson(products[index]);

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
                          ElevatedButton(
                              onPressed: () {
                                print(screenWidth);
                                productService.postOne({
                                  'title': product.title,
                                  'price': product.price,
                                  'description': product.description,
                                  'image': product.image,
                                  'category': product.category
                                });
                              },
                              child: Text(pressed ? 'Add To Cart +1' : 'Add to cart'))
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
