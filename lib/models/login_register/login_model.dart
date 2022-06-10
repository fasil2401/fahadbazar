


class Login {
    Login({
       required this.sts,
       required this.msg,
       required this.user,
    });

    String sts;
    String msg;
    User user;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        sts: json["sts"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
    );
}

class User {
    User({
       this.id,
       this.name,
       this.email,
       this.phone,
       this.password,
       this.address,
       this.pincode,
       this.area,
       this.district,
       this.state,
       this.latitude,
       this.longitude,
       this.joinOn,
    });

    int? id;
    String? name;
    String? email;
    String? phone;
    String? password;
    String? address;
    String? pincode;
    String? area;
    String? district;
    String? state;
    String? latitude;
    String? longitude;
    DateTime? joinOn;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        joinOn: DateTime.parse(json["join_on"]),
    );

}
