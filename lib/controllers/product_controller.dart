import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:xetia_shop/models/product_response.dart';
import 'package:xetia_shop/networks/_network.dart';
import '../models/product_dummy.dart';
import 'package:faker/faker.dart';

class ProductController extends GetxController {
  RxList<DummyProduct> listProduct = List<DummyProduct>().obs;
  RxList<Datum> listProductFetch = List<Datum>().obs;
  RxInt indexProductPicture = 0.obs;
  RxString category = "".obs;
  RxInt page = 1.obs;
  Product product = Product();

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
    // untuk grid dan list sudh menggunakan data fetct
    fetchData();
    // untuk detail mash menggunakan data dummy
    dummyInit();
  }

  void addToFavorite(int idProduct) {
    if (listProductFetch[idProduct].isFavorite.value == true) {
      listProductFetch[idProduct].isFavorite.value = false;
    } else {
      listProductFetch[idProduct].isFavorite.value = true;
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
    await product
        .getProduct(
      page: page.value,
    )
        .then((value) {
      if (value.meta.code == 200) {
        print("load data product ${value.meta.status}");
        print("load data product code ${value.meta.code}");
        listProductFetch.addAll(value.response.data);
      } else {
        print(value.meta.status);
      }
    }).catchError((error) {
      print(error);
    });
  }
}
