// To parse this JSON data, do
//
//     final verify = verifyFromJson(jsonString);

import 'dart:convert';

Verify verifyFromJson(String str) => Verify.fromJson(json.decode(str));

// String verifyToJson(Verify data) => json.encode(data.toJson());

class Verify {
    Verify({
       required this.sts,
       required this.msg,
       required this.user,
    });

    String sts;
    String msg;
    User user;

    factory Verify.fromJson(Map<String, dynamic> json) => Verify(
        sts: json["sts"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "sts": sts,
    //     "msg": msg,
    //     "user": user.toJson(),
    // };
}

class User {
    User({
        this.name,
        this.email,
        this.password,
        this.phone,
        this.joinOn,
        this.id,
    });

    String? name;
    String? email;
    String? password;
    String? phone;
    DateTime?joinOn;
    int? id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        joinOn: DateTime.parse(json["join_on"]),
        id: json["id"],
    );

    // Map<String, dynamic> toJson() => {
    //     "name": name,
    //     "email": email,
    //     "password": password,
    //     "phone": phone,
    //     "join_on": joinOn.toIso8601String(),
    //     "id": id,
    // };
}
