import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_getx/controller/product_controller.dart';

class Homepage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text("Products"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                elevation: 0.0,
              ),
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              label: GetX<ProductController>(
                builder: (controller) => Text(
                  productController.count.toString(),
                ),
              ),
            ),
          ),
        ],
      ),

      // APP SCREEN
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          GetX<ProductController>(
            builder: (controller) => Text(
              "Total Amount: ${productController.totalPrice.toString()} ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  child: Image.asset(
                                    productController
                                        .productData[index].productImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        productController
                                            .productData[index].productName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          productController
                                                  .productData[index].favorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price : ${productController.productData[index].price} ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.snackbar(
                                            "Product added",
                                            productController
                                                .productData[index].productName,
                                          );

                                          productController.addtoCart(
                                              productController
                                                  .productData[index]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.deepPurple),
                                        child: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: productController.productData.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
