import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/category_service/const_url.dart';

class Category {
  Future<CategoryResponse> getCategory() async {
    try {
      http.Response res = await http
          .get("$baseUrl/api/v1/category")
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });
      ;

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(
            meta: MetaCategory(
                code: res.statusCode, status: "Failed load category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }
}
