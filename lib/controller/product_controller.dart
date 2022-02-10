import 'package:get/get.dart';

import 'package:shopping_cart_getx/model/product_model.dart';

class ProductController extends GetxController {
  List<Product> productData = [];

// Empty List used to store clicked add to cart values
  List<Product> cartItem = List<Product>.empty().obs;

// Add to cart Controller
  addtoCart(Product item) {
    cartItem.add(item);
  }

  // Total Amount Controller
  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);
  int get count => cartItem.length;

  @override
  void onInit() {
    super.onInit();
    fetchProductData();
  }

  fetchProductData() async {
    await Future.delayed(Duration(seconds: 1));
    List<Product> serverResponse = [
      Product(
        id: 1,
        productName: "T-Shirt",
        productImage: "assets/images/Blue_Tshirt.jpg",
        productDescription: "This Shirt is cool as you",
        price: 499,
        favorite: false,
      ),
      Product(
        id: 1,
        productName: "Cotton Jeans",
        productImage: "assets/images/jeans.png",
        productDescription: "This Shirt is cool as you",
        price: 100,
        favorite: false,
      ),
      Product(
        id: 1,
        productName: "Snickers",
        productImage: "assets/images/shoes.jpg",
        productDescription: "This Shirt is cool as you",
        price: 200,
        favorite: false,
      ),
    ];
    productData.assignAll(serverResponse);
    //update();
  }
}
