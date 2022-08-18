
import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
    AddressListModel({
       required this.sts,
       required this.msg,
       required this.address,
    });

    String sts;
    String msg;
    List<Address> address;

    factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
        sts: json["sts"],
        msg: json["msg"],
        address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
    };
}

class Address {
    Address({
        this.id,
        this.userId,
        this.addressDefault,
        this.name,
        this.email,
        this.mobile,
        this.phone,
        this.pincode,
        this.landmark,
        this.city,
        this.address,
        this.district,
        this.state,
        this.type,
        this.status,
    });

    int? id;
    int? userId;
    String? addressDefault;
    String? name;
    String? email;
    String? mobile;
    String? phone;
    String? pincode;
    String? landmark;
    String? city;
    String? address;
    String? district;
    String? state;
    String? type;
    String? status;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        addressDefault: json["default"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
        pincode: json["pincode"],
        landmark: json["landmark"],
        city: json["city"],
        address: json["address"],
        district: json["district"],
        state: json["state"],
        type: json["type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "default": addressDefault,
        "name": name,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        "pincode": pincode,
        "landmark": landmark,
        "city": city,
        "address": address,
        "district": district,
        "state": state,
        "type": type,
        "status": status,
    };
}
