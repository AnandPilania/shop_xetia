// To parse this JSON data, do
//
//     final getcategoryResponse = getcategoryResponseFromJson(jsonString);

import 'dart:convert';

GetCategoryResponse getCategoryResponseFromJson(String str) =>
    GetCategoryResponse.fromJson(json.decode(str));

String getCategoryResponseToJson(GetCategoryResponse data) =>
    json.encode(data.toJson());

class GetCategoryResponse {
  GetCategoryResponse({
    this.response,
    this.meta,
  });

  List<ResponseGetCategory> response;
  MetaCategory meta;

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      GetCategoryResponse(
        response: json["response"] != null
            ? List<ResponseGetCategory>.from(
                json["response"].map((x) => ResponseGetCategory.fromJson(x)))
            : null,
        meta: MetaCategory.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class MetaCategory {
  MetaCategory({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory MetaCategory.fromJson(Map<String, dynamic> json) => MetaCategory(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class ResponseGetCategory {
  ResponseGetCategory({
    this.uuid,
    this.name,
  });

  String uuid;
  String name;

  factory ResponseGetCategory.fromJson(Map<String, dynamic> json) => ResponseGetCategory(
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
      };
}
