import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/models/_model.dart';

import 'const_url.dart';

class Product {
  Future<ProductResponse> getProduct(
      {int page = 1, String category = null}) async {
    try {
      http.Response res = category != null
          ? await http
              .get("$baseUrl/api/v1/product?page=$page&category=$category")
              .timeout(const Duration(seconds: 10), onTimeout: () {
              throw TimeoutException("connection time out try agian");
            })
          : await http
              .get("$baseUrl/api/v1/product?page=$page")
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
}
