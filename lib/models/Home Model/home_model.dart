
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
       required this.sts,
       required this.msg,
       required this.categories,
       required this.banners,
       required this.sbanners,
       required this.fbanners,
       required this.popularsProducts,
       required this.trendingProducts,
       required this.bestOffersProducts,
    });

    String sts;
    String msg;
    List<Category> categories;
    List<Sbanners> banners;
    Sbanners sbanners;
    List<Sbanners> fbanners;
    List<Product> popularsProducts;
    List<Product> trendingProducts;
    List<Product> bestOffersProducts;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        sts: json["sts"],
        msg: json["msg"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        banners: List<Sbanners>.from(json["banners"].map((x) => Sbanners.fromJson(x))),
        sbanners: Sbanners.fromJson(json["sbanners"]),
        fbanners: List<Sbanners>.from(json["fbanners"].map((x) => Sbanners.fromJson(x))),
        popularsProducts: List<Product>.from(json["popularsProducts"].map((x) => Product.fromJson(x))),
        trendingProducts: List<Product>.from(json["trendingProducts"].map((x) => Product.fromJson(x))),
        bestOffersProducts: List<Product>.from(json["bestOffersProducts"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "sbanners": sbanners.toJson(),
        "fbanners": List<dynamic>.from(fbanners.map((x) => x.toJson())),
        "popularsProducts": List<dynamic>.from(popularsProducts.map((x) => x.toJson())),
        "trendingProducts": List<dynamic>.from(trendingProducts.map((x) => x.toJson())),
        "bestOffersProducts": List<dynamic>.from(bestOffersProducts.map((x) => x.toJson())),
    };
}

class Sbanners {
    Sbanners({
        this.id,
        this.type,
        this.name,
       required this.image,
        this.url,
        this.disporder,
    });

    dynamic id;
    String? type;
    String? name;
    String image;
    String? url;
    dynamic disporder;

    factory Sbanners.fromJson(Map<String, dynamic> json) => Sbanners(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        image: json["image"],
        url: json["url"],
        disporder: json["disporder"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "image": image,
        "url": url,
        "disporder": disporder,
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.price,
        this.offerprice,
        this.image,
        this.catId,
        this.difference,
    });

    dynamic id;
    String? name;
    dynamic price;
    dynamic offerprice;
    String? image;
    dynamic catId;
    dynamic difference;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        offerprice: json["offerprice"],
        image: json["image"],
        catId: json["cat_id"],
        difference: json["difference"] == null ? null : json["difference"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "offerprice": offerprice,
        "image": image,
        "cat_id": catId,
        "difference": difference == null ? null : difference,
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.image,
        this.disporder,
    });

    dynamic id;
    String? name;
    String? image;
    dynamic disporder;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        disporder: json["disporder"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "disporder": disporder,
    };
}
