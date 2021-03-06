import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';

import '../internet_available.dart';

class Auth {
  Future<SignInResponse> signInRequest(String email, String password) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrl/api/v1/login",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: jsonEncode({"email": email, "password": password}));

        if (res.statusCode == 200) {
          return signInResponseFromJson(res.body);
        } else {
          return signInResponseFromJson(res.body);
        }
      } else {
        return SignInResponse(
            meta: MetaSignIn(
                code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }

  Future<AuthResponse> registerRequest(
      String first, String last, String email, String password) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrl/api/v1/register",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: jsonEncode({
              "first_name": first,
              "last_name": last,
              "password": password,
              "email": email
            }));

        print(res.body);

        if (res.statusCode == 200) {
          return authResponseFromJson(res.body);
        } else if (res.statusCode == 500) {
          return AuthResponse(
              meta: Meta(
                  code: 500, message: "user with this email already exists."));
        } else {
          return null;
        }
      } else {
        return AuthResponse(
            meta: Meta(code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }

  Future<AuthResponse> logoutRequest(
      String tokenAccess, String tokenRefresh) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrl/api/v1/logout",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": "Bearer $tokenAccess"
            },
            body: jsonEncode({"refresh": tokenRefresh}));

        if (res.statusCode == 200) {
          return authResponseFromJson(res.body);
        } else {
          return AuthResponse(
              meta: Meta(code: res.statusCode, message: "Logout Failed"));
        }
      } else {
        return AuthResponse(
            meta: Meta(code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }

  Future<TokenRefreshResponse> tokenRefreshRequest(String refreshT) async {
    try {
      http.Response res = await http
          .post("$kUserUrl/api/v1/login/refresh", body: {"refresh": refreshT});

      if (res.statusCode == 200) {
        return tokenRefreshResponseFromJson(res.body);
      } else {
        return tokenRefreshResponseFromJson(res.body);
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }
}
