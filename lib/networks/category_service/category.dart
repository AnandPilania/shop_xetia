import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';

import '../internet_available.dart';

class Category {
  Future<GetCategoryResponse> getCategory() async {
    try {
      bool isOnline = await intenetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.get("$kProductUrl/api/v1/category");

        if (res.statusCode == 200) {
          return getCategoryResponseFromJson(res.body);
        } else {
          return GetCategoryResponse(
              meta: MetaCategory(
                  code: res.statusCode, status: "Failed load category"));
        }
      } else {
        return GetCategoryResponse(
            meta: MetaCategory(
                code: 408, status: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<ListCategoryResponse> listGetCategory(int limit,
      {int page = 1}) async {
    try {
      http.Response res = await http
          .get("$kProductUrl/api/v1/category/get-data?limit=$limit&page=$page")
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return listCategoryResponseFromJson(res.body);
      } else {
        return ListCategoryResponse(
            meta: MetaCategoryList(
                code: res.statusCode, status: "Failed for list category"));
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<CategoryResponse> postCategory(String token) async {
    try {
      http.Response res = await http
          .post("$kProductUrl/api/v1/category/store",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode({"name": "Example category"}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(
            meta: PostMetaCategory(
                code: res.statusCode, status: "Failed for POST data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<CategoryResponse> putCategory(String token) async {
    try {
      http.Response res = await http
          .put(
              "$kProductUrl/api/v1/category/update/d6aa8c3f-4145-49dc-8519-cd82a96fba98",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: jsonEncode({"name": "Example category edit 2"}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(
            meta: PostMetaCategory(
                code: res.statusCode, status: "Failed for PUT data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<CategoryResponse> deleteCategory(String token) async {
    try {
      http.Response res = await http.delete(
          "$kProductUrl/api/v1/category/delete/d6aa8c3f-4145-49dc-8519-cd82a96fba98",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(
            meta: PostMetaCategory(
                code: res.statusCode,
                status: "Failed for DELETE data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }
}
