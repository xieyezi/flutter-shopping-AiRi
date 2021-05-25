import 'dart:convert';
import 'goods.dart';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  List<GoodsList> result;

  SearchModel({
    required this.result,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        result: List<GoodsList>.from(json["result"].map((x) => GoodsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}
