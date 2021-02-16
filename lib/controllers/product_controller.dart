import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:xetia_shop/networks/_network.dart';
import '../models/product_dummy.dart';
import 'package:faker/faker.dart';

class ProductController extends GetxController {
  RxList<DummyProduct> listProduct = List<DummyProduct>().obs;
  RxInt indexProductPicture = 0.obs;
  RxString category;
  RxInt page = 0.obs;

  void updateIndexProductPicture(int index) {
    indexProductPicture(index);
  }

  void updateCategory(String categoryId) {
    category(categoryId);
  }

  void updatePage(int pageIndex) {
    page(pageIndex);
  }

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
        imageUrl: [
          "https://images-na.ssl-images-amazon.com/images/I/81vJyb43URL._SL1500_.jpg",
          "https://i.pinimg.com/564x/fa/ae/0e/faae0efd550dd06800fccef79a63019b.jpg",
          "https://i.pinimg.com/564x/14/6d/0a/146d0ad30465aea80427bdaff7345518.jpg"
        ],
        isFavorite: false.obs,
        productName: Faker().food.cuisine(),
        productPrice: "Rp" + (Random().nextInt(90)).toString() + ".000",
        productWeight: Random().nextInt(20).toString() + "oz",
        shopLogo: Icons.shopping_bag,
      ));
    }
  }

  void fetchData() async {
    Product product = Product();
    await product.getProduct(page: page.value).then((value) {
      if (value.meta.code == 200) {
        print(value.meta.status);
      } else {
        print(value.meta.status);
      }
    }).catchError((error) {
      print(error);
    });
  }
}
