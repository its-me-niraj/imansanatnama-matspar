// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int productid;
  int id;
  String name;
  String brand;
  String image;
  String weightPretty;
  String slug;
  int price;
  List<String> filters;
  String countryFrom;
  String rating;
  String reviewsCount;
  List<int> priceInfo;
  Map<String, int> wPrices;
  List<dynamic> wFromPrices;
  String medianPrice;

  Product({
    required this.productid,
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.weightPretty,
    required this.slug,
    required this.price,
    required this.filters,
    required this.countryFrom,
    required this.rating,
    required this.reviewsCount,
    required this.priceInfo,
    required this.wPrices,
    required this.wFromPrices,
    required this.medianPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productid: json["productid"],
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        image: json["image"],
        weightPretty: json["weight_pretty"],
        slug: json["slug"],
        price: json["price"],
        filters: List<String>.from(json["filters"].map((x) => x)),
        countryFrom: json["country_from"],
        rating: json["rating"].toString(),
        reviewsCount: json["reviews_count"].toString(),
        priceInfo: List<int>.from(json["price_info"].map((x) => x)),
        wPrices: Map.from(json["w_prices"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        wFromPrices: List<dynamic>.from(json["w_from_prices"].map((x) => x)),
        medianPrice: json["median_price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "id": id,
        "name": name,
        "brand": brand,
        "image": image,
        "weight_pretty": weightPretty,
        "slug": slug,
        "price": price,
        "filters": List<dynamic>.from(filters.map((x) => x)),
        "country_from": countryFrom,
        "rating": rating,
        "reviews_count": reviewsCount,
        "price_info": List<dynamic>.from(priceInfo.map((x) => x)),
        "w_prices":
            Map.from(wPrices).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "w_from_prices": List<dynamic>.from(wFromPrices.map((x) => x)),
        "median_price": medianPrice,
      };
}

class Promo {
  int price;

  Promo({
    required this.price,
  });

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
      };
}

enum Type { FIXED }

final typeValues = EnumValues({"FIXED": Type.FIXED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
