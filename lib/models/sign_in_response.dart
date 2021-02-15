// To parse this JSON data, do
//
//     final SignInResponse = SignInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse SignInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String SignInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.meta,
    this.tokens,
    this.userId,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.userRoles,
    this.entityType,
    this.entityId,
    this.entityName,
  });

  MetaSignIn meta;
  Tokens tokens;
  String userId;
  String firstName;
  String lastName;
  String imageUrl;
  List<UserRole> userRoles;
  dynamic entityType;
  dynamic entityId;
  dynamic entityName;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        meta: MetaSignIn.fromJson(json["meta"]),
        tokens: json["tokens"] != null ? Tokens.fromJson(json["tokens"]) : null,
        userId: json["user_id"] != null ? json["user_id"] : null,
        firstName: json["first_name"] != null ? json["first_name"] : null,
        lastName: json["last_name"] != null ? json["last_name"] : null,
        imageUrl: json["image_url"] != null ? json["image_url"] : null,
        userRoles: json["user_roles"] != null
            ? List<UserRole>.from(
                json["user_roles"].map((x) => UserRole.fromJson(x)))
            : null,
        entityType: json["entity_type"] != null ? json["entity_type"] : null,
        entityId: json["entity_id"] != null ? json["entity_id"] : null,
        entityName: json["entity_name"] != null ? json["entity_name"] : null,
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "tokens": tokens.toJson(),
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "image_url": imageUrl,
        "user_roles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
        "entity_type": entityType,
        "entity_id": entityId,
        "entity_name": entityName,
      };
}

class MetaSignIn {
  MetaSignIn({
    this.message,
    this.code,
  });

  String message;
  int code;

  factory MetaSignIn.fromJson(Map<String, dynamic> json) => MetaSignIn(
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
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

class UserRole {
  UserRole({
    this.role,
    this.roleName,
    this.roleDescription,
  });

  int role;
  String roleName;
  String roleDescription;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        role: json["role"],
        roleName: json["role_name"],
        roleDescription: json["role_description"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "role_name": roleName,
        "role_description": roleDescription,
      };
}
