import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

DummyProduct packageFromJson(String str) => DummyProduct.fromJson(json.decode(str));
String packageToJson(DummyProduct data) => json.encode(data.toJson());

class DummyProduct {
  String imageUrl;
  String productName;
  String productWeight;
  String productPrice;
  RxBool isFavorite;
  IconData shopLogo;

  DummyProduct({
    this.imageUrl,
    this.productName,
    this.productWeight,
    this.productPrice,
    this.isFavorite,
    this.shopLogo,
  });

  factory DummyProduct.fromJson(Map<String, dynamic> json) => DummyProduct(
      imageUrl: json["imageUrl"],
      productName: json["productName"],
      productWeight: json["productWeight"],
      productPrice: json["productPrice"],
      isFavorite: json["isFavorite"],
      shopLogo: json["shopLogo"]);

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "productName": productName,
        "productWeight": productWeight,
        "productPrice": productPrice,
        "isFavorite": isFavorite,
        "shopLogo": shopLogo
      };
}
