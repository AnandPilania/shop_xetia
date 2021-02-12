import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../models/product_dummy.dart';

class ProductController extends GetxController {
  RxList<DummyProduct> listProduct = List<DummyProduct>().obs;

  @override
  void onInit() {
    super.onInit();
    dummyInit();
  }

  void addToFavorite(int idProduct) {
    if (listProduct[idProduct].isFavorite.value == true) {
      listProduct[idProduct].isFavorite.value = false;
    } else {
      listProduct[idProduct].isFavorite.value = true;
    }
  }

  //nantinya fetch dari database
  void dummyInit() {
    for (int i = 0; i < 15; i++) {
      listProduct.add(DummyProduct(
        imageUrl: "https://images-na.ssl-images-amazon.com/images/I/81vJyb43URL._SL1500_.jpg",
        isFavorite: false.obs,
        productName: "Product Name",
        productPrice: "Rp49.998",
        productWeight: "8oz",
        shopLogo: Icons.shopping_bag,
      ));
    }
  }
}
