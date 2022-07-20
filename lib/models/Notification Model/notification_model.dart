// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
    NotificationsModel({
       required this.sts,
       required this.msg,
       required this.notifications,
    });

    String sts;
    String msg;
    List<Notification> notifications;

    factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
        sts: json["sts"],
        msg: json["msg"],
        notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
    };
}

class Notification {
    Notification({
       required this.id,
       required this.title,
       required this.subTitle,
       required this.url,
       required this.createdAt,
    });

    int id;
    String title;
    String subTitle;
    String url;
    DateTime createdAt;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        url: json["url"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "url": url,
        "created_at": createdAt.toIso8601String(),
    };
}
