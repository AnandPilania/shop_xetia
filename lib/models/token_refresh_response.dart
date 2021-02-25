// To parse this JSON data, do
//
//     final tokenRefreshResponse = tokenRefreshResponseFromJson(jsonString);

import 'dart:convert';

TokenRefreshResponse tokenRefreshResponseFromJson(String str) =>
    TokenRefreshResponse.fromJson(json.decode(str));

String tokenRefreshResponseToJson(TokenRefreshResponse data) =>
    json.encode(data.toJson());

class TokenRefreshResponse {
  TokenRefreshResponse({
    this.meta,
    this.tokens,
  });

  MetaTokenRefresh meta;
  TokensRefresh tokens;

  factory TokenRefreshResponse.fromJson(Map<String, dynamic> json) =>
      TokenRefreshResponse(
        meta: MetaTokenRefresh.fromJson(json["meta"]),
        tokens: json["tokens"] != null
            ? TokensRefresh.fromJson(json["tokens"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "tokens": tokens.toJson(),
      };
}

class MetaTokenRefresh {
  MetaTokenRefresh({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory MetaTokenRefresh.fromJson(Map<String, dynamic> json) =>
      MetaTokenRefresh(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class TokensRefresh {
  TokensRefresh({
    this.access,
    this.accessExp,
    this.refresh,
    this.refreshExp,
  });

  String access;
  DateTime accessExp;
  String refresh;
  DateTime refreshExp;

  factory TokensRefresh.fromJson(Map<String, dynamic> json) => TokensRefresh(
        access: json["access"],
        accessExp: DateTime.parse(json["access_exp"]),
        refresh: json["refresh"],
        refreshExp: DateTime.parse(json["refresh_exp"]),
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "access_exp": accessExp.toIso8601String(),
        "refresh": refresh,
        "refresh_exp": refreshExp.toIso8601String(),
      };
}
