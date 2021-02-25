import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xetia_shop/constants/_constants.dart';
import 'package:xetia_shop/models/_model.dart';

import '../internet_available.dart';

class AuthV2 {
  Future<SignInResponseV2> signInRequest(
      {@required String email, @required String password}) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrlV2/api/v2/login",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: jsonEncode({"email": email, "password": password}));

        if (res.statusCode == 200) {
          return signInResponseV2FromJson(res.body);
        } else {
          return signInResponseV2FromJson(res.body);
        }
      } else {
        return SignInResponseV2(
            meta: MetaV2(code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      return e;
    }
  }

  Future<AuthResponse> registerRequestV2(
      {@required String first,
      @required String last,
      @required String email,
      @required String password}) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrlV2/api/v2/register",
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json"
            },
            body: jsonEncode({
              "first_name": first,
              "last_name": last,
              "email": email,
              "password": password
            }));

        if (res.statusCode == 200) {
          return authResponseFromJson(res.body);
        } else if (res.statusCode == 500) {
          return AuthResponse(
              meta: Meta(
                  code: 500, message: "user with this email already exists."));
        } else {
          return AuthResponse(
              meta: Meta(code: res.statusCode, message: "Register Failed"));
        }
      } else {
        return AuthResponse(
            meta: Meta(code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : e");
      return e;
    }
  }

  Future<AuthResponse> logoutRequestV2(
      {@required String tokenAccess, @required String tokenRefresh}) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrlV2/api/v2/logout",
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
              meta: Meta(
                  code: 500,
                  message:
                      "Refresh token is invalid, user might already logged out!"));
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

  Future<TokenRefreshResponse> tokenRefreshRequestV2(
      {@required String refreshT}) async {
    try {
      bool isOnline = await internetAvailable();
      print("internet $isOnline");
      if (isOnline) {
        http.Response res = await http.post("$kUserUrlV2/api/v2/login/refresh",
            body: {"refresh": refreshT});

        if (res.statusCode == 200) {
          return tokenRefreshResponseFromJson(res.body);
        } else if (res.statusCode == 400) {
          return TokenRefreshResponse(
              meta: MetaTokenRefresh(
                  code: 400,
                  message:
                      "Refresh token is invalid, user might already logged out!"));
        } else {
          return TokenRefreshResponse(
              meta: MetaTokenRefresh(
                  code: res.statusCode, message: "Refesh Token Failed"));
        }
      } else {
        return TokenRefreshResponse(
            meta: MetaTokenRefresh(
                code: 408, message: "Check Your Connection Internet"));
      }
    } catch (e) {
      print("Error : $e");
      return e;
    }
  }
}
