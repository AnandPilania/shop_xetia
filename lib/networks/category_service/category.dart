import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/models/_model.dart';
import 'package:xetia_shop/networks/category_service/const_url.dart';

class Category {
  Future<GetCategoryResponse> getCategory() async {
    try {
      http.Response res = await http.get("$baseUrl/api/v1/category").timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return getCategoryResponseFromJson(res.body);
      } else {
        return GetCategoryResponse(meta: MetaCategory(code: res.statusCode, status: "Failed load category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<ListCategoryResponse> listGetCategory() async {
    try {
      http.Response res =
          await http.get("$baseUrl/api/v1/category/get-data?limit=10&page=1").timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return listCategoryResponseFromJson(res.body);
      } else {
        return ListCategoryResponse(meta: MetaCategoryList(code: res.statusCode, status: "Failed for list category"));
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<CategoryResponse> postCategory() async {
    try {
      http.Response res = await http
          .post("$baseUrl/api/v1/category/store",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization":
                    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEzNjU5NjM4LCJqdGkiOiI0NjgzODFlYmU5MTQ0YTBlODFmZmJhZThmMjI1ZDlmZSIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.nr6Ephl-HVa9FTR9nagnmOCoYSBCblUcLqD2t4fYU4A"
              },
              body: jsonEncode({"name": "Example category"}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(meta: PostMetaCategory(code: res.statusCode, status: "Failed for POST data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<CategoryResponse> putCategory() async {
    try {
      http.Response res = await http
          .put("$baseUrl/api/v1/category/update/d6aa8c3f-4145-49dc-8519-cd82a96fba98",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization":
                    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEzNjU5NjM4LCJqdGkiOiI0NjgzODFlYmU5MTQ0YTBlODFmZmJhZThmMjI1ZDlmZSIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.nr6Ephl-HVa9FTR9nagnmOCoYSBCblUcLqD2t4fYU4A"
              },
              body: jsonEncode({"name": "Example category edit 2"}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(meta: PostMetaCategory(code: res.statusCode, status: "Failed for PUT data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<CategoryResponse> deleteCategory() async {
    try {
      http.Response res = await http.delete("$baseUrl/api/v1/category/delete/d6aa8c3f-4145-49dc-8519-cd82a96fba98", headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEzNjU5NjM4LCJqdGkiOiI0NjgzODFlYmU5MTQ0YTBlODFmZmJhZThmMjI1ZDlmZSIsInVzZXJfaWQiOiJlY2ViYmUwNy1lNGFiLTRlOWItYjljYy1mMjkxYmNlYjAxZTMifQ.nr6Ephl-HVa9FTR9nagnmOCoYSBCblUcLqD2t4fYU4A"
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return categoryResponseFromJson(res.body);
      } else {
        return CategoryResponse(meta: PostMetaCategory(code: res.statusCode, status: "Failed for DELETE data category"));
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }
}
