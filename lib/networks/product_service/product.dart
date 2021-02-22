import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';

class Product {
  Future<ProductResponse> getProduct({int page = 1, String category}) async {
    try {
      http.Response res = category != null
          ? await http
              .get("$kProductUrl/api/v1/product?page=$page&category=$category")
              .timeout(const Duration(seconds: 10), onTimeout: () {
              throw TimeoutException("connection time out try agian");
            })
          : await http
              .get("$kProductUrl/api/v1/product?page=$page")
              .timeout(const Duration(seconds: 10), onTimeout: () {
              throw TimeoutException("connection time out try agian");
            });

      if (res.statusCode == 200) {
        return productResponseFromJson(res.body);
      } else {
        return ProductResponse(
            meta:
                MetaProduct(code: res.statusCode, status: "Get Product Gagal"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<AddProductResponse> postProduct() async {
    try {
      http.Response res = await http.post("$kProductUrl/api/v1/product/store",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEzNjU5NjM4LCJqdGkiOiI0NjgzODFlYmU5MTQ0YTBlODFmZmJhZThmMjI1ZDlmZSIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.nr6Ephl-HVa9FTR9nagnmOCoYSBCblUcLqD2t4fYU4A"
          },
          body: jsonEncode({
            "name": "example",
            "description": "example description",
            "weight": "120gram",
            "thumbnail":
                "https://media.suara.com/pictures/480x260/2020/05/28/40379-sajian-mie-ayam-bakso-shutterstock.jpg",
            "category": "71088502-e2c5-4c66-a305-84064e30f48b",
            "discount": "0",
            "images": [
              "https://media.suara.com/pictures/480x260/2020/05/28/40379-sajian-mie-ayam-bakso-shutterstock.jpg"
            ],
            "price": "1000",
            "brand": "example brand",
            "quantity": "0",
            "shop": "b31f781c-5ccb-4e97-a0ee-c0d93fa8f446",
            "user": "59b0fa92-239f-42b3-be8d-949a58b09986"
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
      return null;
    }
    return null;
  }
}
