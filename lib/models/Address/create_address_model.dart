// To parse this JSON data, do
//
//     final createAddressModel = createAddressModelFromJson(jsonString);

import 'dart:convert';

CreateAddressModel createAddressModelFromJson(String str) => CreateAddressModel.fromJson(json.decode(str));

String createAddressModelToJson(CreateAddressModel data) => json.encode(data.toJson());

class CreateAddressModel {
    CreateAddressModel({
       required this.sts,
       required this.msg,
    });

    String sts;
    String msg;

    factory CreateAddressModel.fromJson(Map<String, dynamic> json) => CreateAddressModel(
        sts: json["sts"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
    };
}
