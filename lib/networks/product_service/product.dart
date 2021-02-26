import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';

import '../internet_available.dart';

class Product {
  Future<ProductResponse> getProduct({int page = 1, String category}) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = category != null
            ? await http.get(
                "$kProductUrlV2/api/v1/product?page=$page&category=$category")
            : await http.get("$kProductUrlV2/api/v1/product?page=$page");

        if (res.statusCode == 200) {
          return productResponseFromJson(res.body);
        } else {
          print(res.statusCode);
          return ProductResponse(
              meta: MetaProduct(
                  code: res.statusCode, status: "Get Product Gagal"));
        }
      } else {
        return ProductResponse(
            meta: MetaProduct(
                code: 408, status: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }

  Future<AddProductResponse> postProduct(
      {@required String token,
      @required String name,
      @required String desc,
      @required String weight,
      @required File thumbnail,
      @required String categoryId,
      @required String discount,
      @required List<File> images,
      @required String price,
      String brand,
      String quantity,
      @required String shopId,
      @required String userId}) async {
    try {
      http.Response res = await http.post("$kProductUrlV2/api/v1/product/store",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({
            "name": name,
            "description": desc,
            "weight": weight,
            "thumbnail":
                "https://media.suara.com/pictures/480x260/2020/05/28/40379-sajian-mie-ayam-bakso-shutterstock.jpg",
            "category": categoryId,
            "discount": discount,
            "images": [
              "https://media.suara.com/pictures/480x260/2020/05/28/40379-sajian-mie-ayam-bakso-shutterstock.jpg"
            ],
            "price": price,
            "brand": brand,
            "quantity": quantity,
            "shop": shopId,
            "user": userId
          }));

      if (res.statusCode == 200) {
        AddProductResponse decode = addProductResponseFromJson(res.body);
        print(decode.meta.status);
      } else {
        return AddProductResponse(
            meta: MetaAdd(
                code: res.statusCode, status: "Failed post data product"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
    return null;
  }
}
