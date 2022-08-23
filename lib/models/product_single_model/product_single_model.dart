import 'dart:convert';

SingleProductDetailsModel singleProductDetailsModelFromJson(String str) =>
    SingleProductDetailsModel.fromJson(json.decode(str));

String singleProductDetailsModelToJson(SingleProductDetailsModel data) =>
    json.encode(data.toJson());

class SingleProductDetailsModel {
  SingleProductDetailsModel({
    required this.sts,
    required this.msg,
    required this.product,
    required this.units,
    required this.category,
    this.subCategory,
    required this.similarProducts,
  });

  String sts;
  String msg;
  Product product;
  List<Unit> units;
  String category;
  String? subCategory;
  List<Product> similarProducts;

  factory SingleProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      SingleProductDetailsModel(
        sts: json["sts"],
        msg: json["msg"],
        product: Product.fromJson(json["product"]),
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
        category: json["category"],
        subCategory: json["sub_category"],
        similarProducts: List<Product>.from(
            json["similar_products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "product": product.toJson(),
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
        "category": category,
        "sub_category": subCategory,
        "similar_products":
            List<dynamic>.from(similarProducts.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.catId,
    this.subcatId,
    this.brandId,
    this.stockAvalible,
    required this.name,
    required this.desc,
    this.price,
    this.offerprice,
    this.bestSeller,
    this.featured,
    this.trending,
    this.status,
    this.image,
    this.image2,
    this.image3,
    this.image4,
    this.catName,
    this.subcatName,
    this.unit,
  });

  dynamic id;
  dynamic catId;
  dynamic subcatId;
  dynamic brandId;
  dynamic stockAvalible;
  String name;
  String desc;
  dynamic price;
  dynamic offerprice;
  String? bestSeller;
  String? featured;
  String? trending;
  String? status;
  String? image;
  String? image2;
  String? image3;
  String? image4;
  String? catName;
  String? subcatName;
  Unit? unit;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        catId: json["cat_id"],
        subcatId: json["subcat_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
        stockAvalible: json["stock_avalible"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        offerprice: json["offerprice"],
        bestSeller: json["best_seller"],
        featured: json["featured"],
        trending: json["trending"],
        status: json["status"],
        image: json["image"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        catName: json["cat_name"],
        subcatName: json["subcat_name"],
        unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "subcat_id": subcatId,
        "brand_id": brandId,
        "stock_avalible": stockAvalible,
        "name": name,
        "desc": desc,
        "price": price,
        "offerprice": offerprice,
        "best_seller": bestSeller,
        "featured": featured,
        "trending": trending,
        "status": status,
        "image": image,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "cat_name": catName,
        "subcat_name": subcatName,
        "unit": unit == null ? null : unit!.toJson(),
      };
}

class Unit {
  Unit({
    this.id,
    this.productid,
    this.name,
    this.price,
    this.offerprice,
    this.dispOrder,
    this.status,
  });

  dynamic id;
  dynamic productid;
  String? name;
  dynamic price;
  dynamic offerprice;
  dynamic dispOrder;
  String? status;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        productid: json["productid"],
        name: json["name"],
        price: json["price"],
        offerprice: json["offerprice"],
        dispOrder: json["disp_order"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productid": productid,
        "name": name,
        "price": price,
        "offerprice": offerprice,
        "disp_order": dispOrder,
        "status": status,
      };
}
