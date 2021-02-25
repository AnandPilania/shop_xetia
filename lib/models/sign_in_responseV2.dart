// To parse this JSON data, do
//
//     final signInResponseV2 = signInResponseV2FromJson(jsonString);

import 'dart:convert';

SignInResponseV2 signInResponseV2FromJson(String str) =>
    SignInResponseV2.fromJson(json.decode(str));

String signInResponseV2ToJson(SignInResponseV2 data) =>
    json.encode(data.toJson());

class SignInResponseV2 {
  SignInResponseV2({
    this.meta,
    this.user,
    this.tokens,
  });

  Meta meta;
  User user;
  Tokens tokens;

  factory SignInResponseV2.fromJson(Map<String, dynamic> json) =>
      SignInResponseV2(
        meta: Meta.fromJson(json["meta"]),
        user: User.fromJson(json["user"]),
        tokens: Tokens.fromJson(json["tokens"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "user": user.toJson(),
        "tokens": tokens.toJson(),
      };
}

class Meta {
  Meta({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class Tokens {
  Tokens({
    this.refresh,
    this.refreshExp,
    this.access,
    this.accessExp,
  });

  String refresh;
  DateTime refreshExp;
  String access;
  DateTime accessExp;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        refreshExp: DateTime.parse(json["refresh_exp"]),
        access: json["access"],
        accessExp: DateTime.parse(json["access_exp"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "refresh_exp": refreshExp.toIso8601String(),
        "access": access,
        "access_exp": accessExp.toIso8601String(),
      };
}

class User {
  User({
    this.id,
    this.email,
    this.slug,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.mobilePhone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.userEntities,
  });

  String id;
  String email;
  String slug;
  String firstName;
  String lastName;
  dynamic imageUrl;
  dynamic mobilePhone;
  dynamic address;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  List<dynamic> userEntities;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        slug: json["slug"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        imageUrl: json["image_url"],
        mobilePhone: json["mobile_phone"],
        address: json["address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        userEntities: List<dynamic>.from(json["user_entities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "slug": slug,
        "first_name": firstName,
        "last_name": lastName,
        "image_url": imageUrl,
        "mobile_phone": mobilePhone,
        "address": address,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "user_entities": List<dynamic>.from(userEntities.map((x) => x)),
      };
}
