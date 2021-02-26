// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.response,
    this.meta,
  });

  Response response;
  MetaProduct meta;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        response: Response.fromJson(json["response"]),
        meta: MetaProduct.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "meta": meta.toJson(),
      };
}

class MetaProduct {
  MetaProduct({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory MetaProduct.fromJson(Map<String, dynamic> json) => MetaProduct(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class Response {
  Response({
    this.data,
    this.currentPage,
    this.nextPageUrl,
    this.previousePageUrl,
    this.total,
  });

  List<Datum> data;
  int currentPage;
  dynamic nextPageUrl;
  dynamic previousePageUrl;
  int total;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currentPage: json["current_page"],
        nextPageUrl: json["next_page_url"],
        previousePageUrl: json["previouse_page_url"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "next_page_url": nextPageUrl,
        "previouse_page_url": previousePageUrl,
        "total": total,
      };
}

class Datum {
  Datum(
      {this.uuid,
      this.name,
      this.slug,
      this.brand,
      this.description,
      this.weight,
      this.discount,
      this.thumbnail,
      this.price,
      this.categoryId,
      this.category,
      this.shopId,
      this.quantity,
      this.status,
      this.statusLabel,
      this.images,
      this.variants,
      this.userId,
      this.createdAt,
      this.updateAt,
      this.isFavorite,
      this.shopLogo});

  String uuid;
  String name;
  String slug;
  String brand;
  String description;
  String weight;
  String discount;
  String thumbnail;
  String price;
  String categoryId;
  String category;
  String shopId;
  int quantity;
  int status;
  String statusLabel;
  List<dynamic> images;
  List<Variant> variants;
  String userId;
  String createdAt;
  String updateAt;
  RxBool isFavorite;
  IconData shopLogo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      uuid: json["uuid"],
      name: json["name"],
      slug: json["slug"],
      brand: json["brand"],
      description: json["description"],
      weight: json["weight"],
      discount: json["discount"],
      thumbnail: json["thumbnail"],
      price: json["price"],
      categoryId: json["category_id"],
      category: json["category"],
      shopId: json["shop_id"],
      quantity: json["quantity"],
      status: json["status"],
      statusLabel: json["status_label"],
      images: json["images"].length != 0
          ? List<dynamic>.from(json["images"].map((x) => x))
          : [
              json["thumbnail"],
              "https://images-na.ssl-images-amazon.com/images/I/81vJyb43URL._SL1500_.jpg",
              "https://i.pinimg.com/564x/fa/ae/0e/faae0efd550dd06800fccef79a63019b.jpg",
            ],
      variants:
          List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
      userId: json["user_id"],
      createdAt: json["created_at"],
      updateAt: json["update_at"],
      isFavorite: json["isFavorite"] != null ? json["isFavorite"] : false.obs,
      shopLogo:
          json["shopLogo"] != null ? json["shopLogo"] : Icons.shopping_bag);

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "slug": slug,
        "brand": brand,
        "description": description,
        "weight": weight,
        "discount": discount,
        "thumbnail": thumbnail,
        "price": price,
        "category_id": categoryId,
        "category": category,
        "shop_id": shopId,
        "quantity": quantity,
        "status": status,
        "status_label": statusLabel,
        "images": List<dynamic>.from(images.map((x) => x)),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "user_id": userId,
        "created_at": createdAt,
        "update_at": updateAt,
        "isFavorite": isFavorite,
        "shopLogo": shopLogo
      };
}

class Variant {
  Variant({
    this.uuid,
    this.variant,
  });

  String uuid;
  String variant;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        uuid: json["uuid"],
        variant: json["variant"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "variant": variant,
      };
}
