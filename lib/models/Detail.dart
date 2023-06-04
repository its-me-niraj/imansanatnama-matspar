// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
  Payload payload;
  String type;
  String slug;
  bool active;

  Detail({
    required this.payload,
    required this.type,
    required this.slug,
    required this.active,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        payload: Payload.fromJson(json["payload"]),
        type: json["type"],
        slug: json["slug"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "payload": payload.toJson(),
        "type": type,
        "slug": slug,
        "active": active,
      };
}

class Payload {
  int productid;
  int id;
  String name;
  String brand;
  int brandid;
  String brandslug;
  String supplier;
  String ingredients;
  String description;
  String image;
  String weightPretty;
  String slug;
  int price;
  Map<String, int> prices;
  int recyclefee;
  Map<String, PromoValue> promo;
  String durability;
  String alcoholPercentage;
  String countryFrom;
  List<int> categoryids;
  List<String> filters;
  bool ourOwnImage;
  String reviews;
  String temperatureMin;
  String temperatureMax;
  String nonfoodIngredients;
  String nutritionClaim;
  String hazards;
  String warnings;
  String packaging;
  String allergenStatement;
  String storage;
  String usage;
  String servingsPackage;
  String shortmarketingMessages;
  List<String> packagingType;
  String packagingWeight;
  String recyclable;
  String recyclingMessage;
  String countryOrigin;
  String comparisonType;
  String comparisonMeasurement;
  String comparisonUnit;
  String depth;
  String height;
  String width;
  String quantity;
  String season;
  String originalSupplier;
  String grossWeight;
  String contentWeight;
  String netWeight;
  String totalLifespan;
  String openLifespan;
  List<NutritionalValue> nutritionalValue;
  String weightIsh;
  String rating;
  String reviewsCount;
  List<int> leafCategoryids;
  List<int> priceInfo;
  Map<String, int> wPrices;
  Map<String, PromoValue> wPromo;
  List<dynamic> wFromPrices;
  List<Similar> similar;

  Payload({
    required this.productid,
    required this.id,
    required this.name,
    required this.brand,
    required this.brandid,
    required this.brandslug,
    required this.supplier,
    required this.ingredients,
    required this.description,
    required this.image,
    required this.weightPretty,
    required this.slug,
    required this.price,
    required this.prices,
    required this.recyclefee,
    required this.promo,
    required this.durability,
    required this.alcoholPercentage,
    required this.countryFrom,
    required this.categoryids,
    required this.filters,
    required this.ourOwnImage,
    required this.reviews,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.nonfoodIngredients,
    required this.nutritionClaim,
    required this.hazards,
    required this.warnings,
    required this.packaging,
    required this.allergenStatement,
    required this.storage,
    required this.usage,
    required this.servingsPackage,
    required this.shortmarketingMessages,
    required this.packagingType,
    required this.packagingWeight,
    required this.recyclable,
    required this.recyclingMessage,
    required this.countryOrigin,
    required this.comparisonType,
    required this.comparisonMeasurement,
    required this.comparisonUnit,
    required this.depth,
    required this.height,
    required this.width,
    required this.quantity,
    required this.season,
    required this.originalSupplier,
    required this.grossWeight,
    required this.contentWeight,
    required this.netWeight,
    required this.totalLifespan,
    required this.openLifespan,
    required this.nutritionalValue,
    required this.weightIsh,
    required this.rating,
    required this.reviewsCount,
    required this.leafCategoryids,
    required this.priceInfo,
    required this.wPrices,
    required this.wPromo,
    required this.wFromPrices,
    required this.similar,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        productid: json["productid"],
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        brandid: json["brandid"],
        brandslug: json["brandslug"],
        supplier: json["supplier"],
        ingredients: json["ingredients"],
        description: json["description"],
        image: json["image"],
        weightPretty: json["weight_pretty"],
        slug: json["slug"],
        price: json["price"],
        prices:
            Map.from(json["prices"]).map((k, v) => MapEntry<String, int>(k, v)),
        recyclefee: json["recyclefee"],
        promo: Map.from(json["promo"]).map(
            (k, v) => MapEntry<String, PromoValue>(k, PromoValue.fromJson(v))),
        durability: json["durability"],
        alcoholPercentage: json["alcohol_percentage"],
        countryFrom: json["country_from"],
        categoryids: List<int>.from(json["categoryids"].map((x) => x)),
        filters: List<String>.from(json["filters"].map((x) => x)),
        ourOwnImage: false,
        reviews: "",
        temperatureMin: json["temperature_min"],
        temperatureMax: json["temperature_max"],
        nonfoodIngredients: json["nonfood_ingredients"],
        nutritionClaim: json["nutrition_claim"],
        hazards: json["hazards"],
        warnings: json["warnings"],
        packaging: json["packaging"].toString(),
        allergenStatement: json["allergen_statement"],
        storage: json["storage"],
        usage: json["usage"],
        servingsPackage: json["servings_package"],
        shortmarketingMessages: json["shortmarketing_messages"],
        packagingType: List<String>.from(json["packaging_type"].map((x) => x)),
        packagingWeight: json["packaging_weight"],
        recyclable: json["recyclable"],
        recyclingMessage: json["recycling_message"],
        countryOrigin: json["country_origin"],
        comparisonType: json["comparison_type"],
        comparisonMeasurement: json["comparison_measurement"],
        comparisonUnit: json["comparison_unit"],
        depth: json["depth"],
        height: json["height"],
        width: json["width"],
        quantity: json["quantity"],
        season: json["season"],
        originalSupplier: json["original_supplier"],
        grossWeight: json["gross_weight"],
        contentWeight: json["content_weight"],
        netWeight: json["net_weight"],
        totalLifespan: json["total_lifespan"],
        openLifespan: json["open_lifespan"],
        nutritionalValue: List<NutritionalValue>.from(
            json["nutritional_value"].map((x) => NutritionalValue.fromJson(x))),
        weightIsh: json["weight_ish"],
        rating: json["rating"].toString(),
        reviewsCount: json["reviews_count"].toString(),
        leafCategoryids: List<int>.from(json["leaf_categoryids"].map((x) => x)),
        priceInfo: List<int>.from(json["price_info"].map((x) => x)),
        wPrices: Map.from(json["w_prices"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        wPromo: Map.from(json["w_promo"]).map(
            (k, v) => MapEntry<String, PromoValue>(k, PromoValue.fromJson(v))),
        wFromPrices: List<dynamic>.from(json["w_from_prices"].map((x) => x)),
        similar:
            List<Similar>.from(json["similar"].map((x) => Similar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "id": id,
        "name": name,
        "brand": brand,
        "brandid": brandid,
        "brandslug": brandslug,
        "supplier": supplier,
        "ingredients": ingredients,
        "description": description,
        "image": image,
        "weight_pretty": weightPretty,
        "slug": slug,
        "price": price,
        "prices":
            Map.from(prices).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "recyclefee": recyclefee,
        "promo": Map.from(promo)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "durability": durability,
        "alcohol_percentage": alcoholPercentage,
        "country_from": countryFrom,
        "categoryids": List<dynamic>.from(categoryids.map((x) => x)),
        "filters": List<dynamic>.from(filters.map((x) => x)),
        "our_own_image": ourOwnImage,
        "reviews": reviews,
        "temperature_min": temperatureMin,
        "temperature_max": temperatureMax,
        "nonfood_ingredients": nonfoodIngredients,
        "nutrition_claim": nutritionClaim,
        "hazards": hazards,
        "warnings": warnings,
        "packaging": packaging,
        "allergen_statement": allergenStatement,
        "storage": storage,
        "usage": usage,
        "servings_package": servingsPackage,
        "shortmarketing_messages": shortmarketingMessages,
        "packaging_type": List<dynamic>.from(packagingType.map((x) => x)),
        "packaging_weight": packagingWeight,
        "recyclable": recyclable,
        "recycling_message": recyclingMessage,
        "country_origin": countryOrigin,
        "comparison_type": comparisonType,
        "comparison_measurement": comparisonMeasurement,
        "comparison_unit": comparisonUnit,
        "depth": depth,
        "height": height,
        "width": width,
        "quantity": quantity,
        "season": season,
        "original_supplier": originalSupplier,
        "gross_weight": grossWeight,
        "content_weight": contentWeight,
        "net_weight": netWeight,
        "total_lifespan": totalLifespan,
        "open_lifespan": openLifespan,
        "nutritional_value":
            List<dynamic>.from(nutritionalValue.map((x) => x.toJson())),
        "weight_ish": weightIsh,
        "rating": rating,
        "reviews_count": reviewsCount,
        "leaf_categoryids": List<dynamic>.from(leafCategoryids.map((x) => x)),
        "price_info": List<dynamic>.from(priceInfo.map((x) => x)),
        "w_prices":
            Map.from(wPrices).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "w_promo": Map.from(wPromo)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "w_from_prices": List<dynamic>.from(wFromPrices.map((x) => x)),
        "similar": List<dynamic>.from(similar.map((x) => x.toJson())),
      };
}

class NutritionalValue {
  String quantityUnit;
  int quantity;
  String quantityType;
  String? intakeType;
  dynamic serving;
  List<Nutrient> nutrients;
  String preparation;

  NutritionalValue({
    required this.quantityUnit,
    required this.quantity,
    required this.quantityType,
    this.intakeType,
    this.serving,
    required this.nutrients,
    required this.preparation,
  });

  factory NutritionalValue.fromJson(Map<String, dynamic> json) =>
      NutritionalValue(
        quantityUnit: json["quantity_unit"],
        quantity: json["quantity"],
        quantityType: json["quantity_type"],
        intakeType: json["intake_type"],
        serving: json["serving"],
        nutrients: List<Nutrient>.from(
            json["nutrients"].map((x) => Nutrient.fromJson(x))),
        preparation: json["preparation"],
      );

  Map<String, dynamic> toJson() => {
        "quantity_unit": quantityUnit,
        "quantity": quantity,
        "quantity_type": quantityType,
        "intake_type": intakeType,
        "serving": serving,
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
        "preparation": preparation,
      };
}

class Nutrient {
  int daily;
  String type;
  double value;

  Nutrient({
    required this.daily,
    required this.type,
    required this.value,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        daily: json["daily"],
        type: json["type"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "daily": daily,
        "type": type,
        "value": value,
      };
}

enum Measurement { KJO, E14, GRM }

final measurementValues = EnumValues(
    {"E14": Measurement.E14, "GRM": Measurement.GRM, "KJO": Measurement.KJO});

class PromoValue {
  int? afteramount;
  int price;
  Type type;
  bool? bonuscard;
  int? maxperorder;

  PromoValue({
    this.afteramount,
    required this.price,
    required this.type,
    this.bonuscard,
    this.maxperorder,
  });

  factory PromoValue.fromJson(Map<String, dynamic> json) => PromoValue(
        afteramount: json["afteramount"],
        price: json["price"],
        type: typeValues.map[json["type"]]!,
        bonuscard: json["bonuscard"],
        maxperorder: json["maxperorder"],
      );

  Map<String, dynamic> toJson() => {
        "afteramount": afteramount,
        "price": price,
        "type": typeValues.reverse[type],
        "bonuscard": bonuscard,
        "maxperorder": maxperorder,
      };
}

enum Type { X_FOR_FIXED, FIXED }

final typeValues =
    EnumValues({"FIXED": Type.FIXED, "X_FOR_FIXED": Type.X_FOR_FIXED});

class Similar {
  int productid;
  int id;
  String name;
  String brand;
  int brandid;
  String image;
  String weightPretty;
  String weightIsh;
  String slug;
  int price;
  Map<String, int> prices;
  dynamic promo;
  List<String> filters;
  String countryFrom;
  List<int> categoryids;
  String rating;
  String reviewsCount;
  List<int> priceInfo;
  Map<String, int> wPrices;
  dynamic wPromo;
  List<dynamic> wFromPrices;

  Similar({
    required this.productid,
    required this.id,
    required this.name,
    required this.brand,
    required this.brandid,
    required this.image,
    required this.weightPretty,
    required this.weightIsh,
    required this.slug,
    required this.price,
    required this.prices,
    required this.promo,
    required this.filters,
    required this.countryFrom,
    required this.categoryids,
    required this.rating,
    required this.reviewsCount,
    required this.priceInfo,
    required this.wPrices,
    required this.wPromo,
    required this.wFromPrices,
  });

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
        productid: json["productid"],
        id: json["id"],
        name: json["name"],
        brand: json["brand"],
        brandid: json["brandid"],
        image: json["image"],
        weightPretty: json["weight_pretty"],
        weightIsh: json["weight_ish"],
        slug: json["slug"],
        price: json["price"],
        prices:
            Map.from(json["prices"]).map((k, v) => MapEntry<String, int>(k, v)),
        promo: json["promo"],
        filters: List<String>.from(json["filters"].map((x) => x)),
        countryFrom: json["country_from"],
        categoryids: List<int>.from(json["categoryids"].map((x) => x)),
        rating: json["rating"],
        reviewsCount: json["reviews_count"],
        priceInfo: List<int>.from(json["price_info"].map((x) => x)),
        wPrices: Map.from(json["w_prices"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        wPromo: json["w_promo"],
        wFromPrices: List<dynamic>.from(json["w_from_prices"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "id": id,
        "name": name,
        "brand": brand,
        "brandid": brandid,
        "image": image,
        "weight_pretty": weightPretty,
        "weight_ish": weightIsh,
        "slug": slug,
        "price": price,
        "prices":
            Map.from(prices).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "promo": promo,
        "filters": List<dynamic>.from(filters.map((x) => x)),
        "country_from": countryFrom,
        "categoryids": List<dynamic>.from(categoryids.map((x) => x)),
        "rating": rating,
        "reviews_count": reviewsCount,
        "price_info": List<dynamic>.from(priceInfo.map((x) => x)),
        "w_prices":
            Map.from(wPrices).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "w_promo": wPromo,
        "w_from_prices": List<dynamic>.from(wFromPrices.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
