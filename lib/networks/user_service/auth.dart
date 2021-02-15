import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/models/_model.dart';

import 'const_url.dart';

class Auth {
  Future<SignInResponse> signInRequest(String email, String password) async {
    try {
      http.Response res = await http
          .post("$base_url/api/v1/login",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
              body: jsonEncode({"email": email, "password": password}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try again");
      });

      if (res.statusCode == 200) {
        return signInResponseFromJson(res.body);
      } else {
        return signInResponseFromJson(res.body);
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }

  Future<AuthResponse> registerRequest(
      String first, String last, String email, String password) async {
    try {
      http.Response res = await http
          .post("$base_url/api/v1/register",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
              },
              body: jsonEncode({
                "first_name": first,
                "last_name": last,
                "email": email,
                "password": password
              }))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return authResponseFromJson(res.body);
      } else if (res.statusCode == 500) {
        return AuthResponse(
            meta: Meta(
                code: 500, message: "user with this email already exists."));
      } else {
        return null;
      }
    } catch (e) {
      print("Error : e");
      return null;
    }
  }

  Future<AuthResponse> logoutRequest(
      String tokenAccess, String tokenRefresh) async {
    try {
      http.Response res = await http
          .post("$base_url/api/v1/logout",
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer $tokenAccess"
              },
              body: jsonEncode({"refresh": tokenRefresh}))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (res.statusCode == 200) {
        return authResponseFromJson(res.body);
      } else {
        return authResponseFromJson(res.body);
      }
    } catch (e) {
      print("Error : $e");
      return null;
    }
  }
}
