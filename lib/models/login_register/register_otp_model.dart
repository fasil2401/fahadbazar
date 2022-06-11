// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
       required this.sts,
       required this.msg,
       required this.otp,
    });

    String sts;
    String msg;
    String otp;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        sts: json["sts"],
        msg: json["msg"],
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "otp": otp,
    };
}

//credential check
CheckCredential checkCredentialFromJson(String str) => CheckCredential.fromJson(json.decode(str));

//String checkCredentialToJson(CheckCredential data) => json.encode(data.toJson());

class CheckCredential {
    CheckCredential({
       required this.sts,
       required this.msg,
    });

    String sts;
    String msg;

    factory CheckCredential.fromJson(Map<String, dynamic> json) => CheckCredential(
        sts: json["sts"],
        msg: json["msg"],
    );

    // Map<String, dynamic> toJson() => {
    //     "sts": sts,
    //     "msg": msg,
    // };
}
