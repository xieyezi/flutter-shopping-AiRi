import 'dart:convert';

import 'goods.dart';

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
