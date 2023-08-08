import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideamagix_ecommerce_flutter_app/controllers/product.controller.dart';
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
  CartService cartService = Get.find<CartService>();
  final ProductController productController = Get.put(ProductController());

  TextEditingController searchQuery = TextEditingController();
  String sort = 'asc';
  List<String> list = <String>[
    'asc',
    'desc',
  ];
  bool pressed = false;
  String dropdownValue = 'asc';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  loadData() async {
    await productController.getMany(queryParamters: {
      'sort': sort
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideamagix Store'),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
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
                        onChanged: (String? value) async {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                          if (value == 'asc') {
                            await productController.sortList('desc');
                          } else {
                            await productController.sortList('asc');
                          }
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                            onTap: () {},
                          );
                        }).toList(),
                      ),
                    ))
              ],
            ),
          ),
          // SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  final Product product = productController.products[index];
                  // final Product product = Product.fromJson(products[index]);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                product.image,
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                            ),
                            Text(
                              product.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('₹ ${product.price}'),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text('${product.rating.rate}'),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    print(screenWidth);
                                    cartService.postOne({
                                      'userId': product.title,
                                      'date': product.price,
                                      'description': product.description,
                                      'image': product.image,
                                      'category': product.category
                                    });
                                  },
                                  child: Text(pressed ? 'Add To Cart +1' : 'Add to cart')),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              // return Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: FutureBuilder(
              //     future: productController.getMany(queryParamters: {
              //       'sort': sort
              //     }),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }

              //       print(snapshot.data);
              //       // return Container();

              //       // List<Product> products = snapshot.data ?? [];
              //       List<Product> products = productController.products;

              //       return GridView.builder(
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
              //         itemCount: products.length,
              //         itemBuilder: (context, index) {
              //           final Product product = products[index];
              //           // final Product product = Product.fromJson(products[index]);

              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Material(
              //               elevation: 5,
              //               borderRadius: BorderRadius.circular(16),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Image.network(
              //                         product.image,
              //                         fit: BoxFit.cover,
              //                         height: 180,
              //                       ),
              //                     ),
              //                     Text(
              //                       product.title,
              //                       style: TextStyle(fontWeight: FontWeight.bold),
              //                       maxLines: 3,
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text('₹ ${product.price}'),
              //                         Row(
              //                           children: [
              //                             Icon(Icons.star, color: Colors.yellow),
              //                             Text('${product.rating.rate}'),
              //                           ],
              //                         )
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       width: double.infinity,
              //                       child: ElevatedButton(
              //                           onPressed: () {
              //                             print(screenWidth);
              //                             productService.postOne({
              //                               'title': product.title,
              //                               'price': product.price,
              //                               'description': product.description,
              //                               'image': product.image,
              //                               'category': product.category
              //                             });
              //                           },
              //                           child: Text(pressed ? 'Add To Cart +1' : 'Add to cart')),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Icon(Icons.home),
            Text('Home'),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: AutomaticNotchedShape.new(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: TextButton.icon(onPressed: () {}, icon: Icon(Icons.person), label: Text('Profile')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: TextButton.icon(
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: Badge(label: Text('0'), backgroundColor: Colors.black, child: Icon(Icons.shopping_cart)),
                  label: Text('Cart')),
            ),
          ],
        ),
      ),
    );
  }
}
