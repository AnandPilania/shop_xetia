// To parse this JSON data, do
//
//     final addProductResponse = addProductResponseFromJson(jsonString);

import 'dart:convert';

AddProductResponse addProductResponseFromJson(String str) =>
    AddProductResponse.fromJson(json.decode(str));

String addProductResponseToJson(AddProductResponse data) =>
    json.encode(data.toJson());

class AddProductResponse {
  AddProductResponse({
    this.response,
    this.meta,
  });

  ResponseAdd response;
  MetaAdd meta;

  factory AddProductResponse.fromJson(Map<String, dynamic> json) =>
      AddProductResponse(
        response: json["response"] != null
            ? ResponseAdd.fromJson(json["response"])
            : null,
        meta: MetaAdd.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "meta": meta.toJson(),
      };
}

class MetaAdd {
  MetaAdd({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory MetaAdd.fromJson(Map<String, dynamic> json) => MetaAdd(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class ResponseAdd {
  ResponseAdd({
    this.name,
    this.brand,
    this.slug,
    this.description,
    this.weight,
    this.thumbnail,
    this.discount,
    this.price,
    this.categoryId,
    this.shopId,
    this.userId,
    this.quantity,
    this.status,
    this.uuid,
    this.updatedAt,
    this.createdAt,
    this.statusLabel,
  });

  String name;
  String brand;
  String slug;
  String description;
  String weight;
  String thumbnail;
  String discount;
  String price;
  String categoryId;
  String shopId;
  String userId;
  String quantity;
  int status;
  String uuid;
  DateTime updatedAt;
  DateTime createdAt;
  String statusLabel;

  factory ResponseAdd.fromJson(Map<String, dynamic> json) => ResponseAdd(
        name: json["name"],
        brand: json["brand"],
        slug: json["slug"],
        description: json["description"],
        weight: json["weight"],
        thumbnail: json["thumbnail"],
        discount: json["discount"],
        price: json["price"],
        categoryId: json["category_id"],
        shopId: json["shop_id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        status: json["status"],
        uuid: json["uuid"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        statusLabel: json["status_label"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "slug": slug,
        "description": description,
        "weight": weight,
        "thumbnail": thumbnail,
        "discount": discount,
        "price": price,
        "category_id": categoryId,
        "shop_id": shopId,
        "user_id": userId,
        "quantity": quantity,
        "status": status,
        "uuid": uuid,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "status_label": statusLabel,
      };
}
