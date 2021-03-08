// To parse this JSON data, do
//
//     final toDoResponse = toDoResponseFromJson(jsonString);

import 'dart:convert';

FetchNotificationResponse fetchNotificationResponseFromJson(String str) =>
    FetchNotificationResponse.fromJson(json.decode(str));

String fetchNotificationResponseToJson(FetchNotificationResponse data) =>
    json.encode(data.toJson());

class FetchNotificationResponse {
  FetchNotificationResponse({
    this.info,
    this.notifications,
  });

  String info;
  List<NotificationItem> notifications;

  factory FetchNotificationResponse.fromJson(Map<String, dynamic> json) =>
      FetchNotificationResponse(
        info: json["info"],
        notifications: List<NotificationItem>.from(
            json["notifications"].map((x) => NotificationItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info,
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class NotificationItem {
  NotificationItem({
    this.id,
    this.title,
    this.message,
    this.link,
    this.timestamp,
    this.status,
  });

  String id;
  String title;
  String message;
  String link;
  DateTime timestamp;
  int status;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      NotificationItem(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        link: json["link"],
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "link": link,
        "timestamp": timestamp.toIso8601String(),
        "status": status,
      };
}
