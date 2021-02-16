// To parse this JSON data, do
//
//     final listCategoryResponse = listCategoryResponseFromJson(jsonString);

import 'dart:convert';

ListCategoryResponse listCategoryResponseFromJson(String str) =>
    ListCategoryResponse.fromJson(json.decode(str));

String listCategoryResponseToJson(ListCategoryResponse data) =>
    json.encode(data.toJson());

class ListCategoryResponse {
  ListCategoryResponse({
    this.response,
    this.meta,
  });

  ResponseCategoryList response;
  MetaCategoryList meta;

  factory ListCategoryResponse.fromJson(Map<String, dynamic> json) =>
      ListCategoryResponse(
        response: ResponseCategoryList.fromJson(json["response"]),
        meta: MetaCategoryList.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "meta": meta.toJson(),
      };
}

class MetaCategoryList {
  MetaCategoryList({
    this.code,
    this.status,
  });

  int code;
  String status;

  factory MetaCategoryList.fromJson(Map<String, dynamic> json) => MetaCategoryList(
        code: json["code"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
      };
}

class ResponseCategoryList {
  ResponseCategoryList({
    this.data,
    this.currentPage,
    this.nextPageUrl,
    this.previousePageUrl,
    this.total,
  });

  List<DatumCategory> data;
  int currentPage;
  dynamic nextPageUrl;
  dynamic previousePageUrl;
  int total;

  factory ResponseCategoryList.fromJson(Map<String, dynamic> json) => ResponseCategoryList(
        data: List<DatumCategory>.from(json["data"].map((x) => DatumCategory.fromJson(x))),
        currentPage: json["current_page"],
        nextPageUrl: json["next_page_url"],
        previousePageUrl: json["previouse_page_url"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "next_page_url": nextPageUrl,
        "previouse_page_url": previousePageUrl,
        "total": total,
      };
}

class DatumCategory {
  DatumCategory({
    this.uuid,
    this.name,
  });

  String uuid;
  String name;

  factory DatumCategory.fromJson(Map<String, dynamic> json) => DatumCategory(
        uuid: json["uuid"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
      };
}
