import 'dart:convert';

CateGoryModel cateGoryModelFromJson(String str) =>
    CateGoryModel.fromJson(json.decode(str));

String cateGoryModelToJson(CateGoryModel data) => json.encode(data.toJson());

class CateGoryModel {
  List<CategoryDatum> categoryData;

  CateGoryModel({
    required this.categoryData,
  });

  factory CateGoryModel.fromJson(Map<String, dynamic> json) => CateGoryModel(
        categoryData: List<CategoryDatum>.from(
            json["categoryData"].map((x) => CategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryData": List<dynamic>.from(categoryData.map((x) => x.toJson())),
      };
}

class CategoryDatum {
  String name;
  String banner;
  List<ListElement> list;

  CategoryDatum({
    required this.name,
    required this.banner,
    required this.list,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        name: json["name"],
        banner: json["banner"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "banner": banner,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  String name;
  String icon;

  ListElement({
    required this.name,
    required this.icon,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "icon": icon,
      };
}
