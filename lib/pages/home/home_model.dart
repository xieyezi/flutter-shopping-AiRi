import 'dart:convert';
HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<String> banerList;
  List<BrandListElement> cateGoryList;
  List<BrandListElement> brandList;
  List<GoodsList> hotList;

  HomeModel({
    required this.banerList,
    required this.cateGoryList,
    required this.brandList,
    required this.hotList,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        banerList: List<String>.from(json["banerList"].map((x) => x)),
        cateGoryList: List<BrandListElement>.from(json["cateGoryList"].map((x) => BrandListElement.fromJson(x))),
        brandList: List<BrandListElement>.from(json["brandList"].map((x) => BrandListElement.fromJson(x))),
        hotList: List<GoodsList>.from(json["hotList"].map((x) => GoodsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banerList": List<dynamic>.from(banerList.map((x) => x)),
        "cateGoryList": List<dynamic>.from(cateGoryList.map((x) => x.toJson())),
        "brandList": List<dynamic>.from(brandList.map((x) => x.toJson())),
        "hotList": List<dynamic>.from(hotList.map((x) => x.toJson())),
      };
}

class BrandListElement {
  String name;
  String icon;

  BrandListElement({
    required this.name,
    required this.icon,
  });

  factory BrandListElement.fromJson(Map<String, dynamic> json) => BrandListElement(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}

/// 商品列表Model
class GoodsList {
  String goodsId;
  String goodsMiniPrice;
  String goodsName;
  String goodsPicUrl;

  GoodsList({
    required this.goodsId,
    required this.goodsMiniPrice,
    required this.goodsName,
    required this.goodsPicUrl,
  });

  factory GoodsList.fromJson(Map<String, dynamic> json) => GoodsList(
        goodsId: json["goodsId"],
        goodsMiniPrice: json["goodsMiniPrice"],
        goodsName: json["goodsName"],
        goodsPicUrl: json["goodsPicUrl"],
      );

  Map<String, dynamic> toJson() => {
        "goodsId": goodsId,
        "goodsMiniPrice": goodsMiniPrice,
        "goodsName": goodsName,
        "goodsPicUrl": goodsPicUrl,
      };
}
