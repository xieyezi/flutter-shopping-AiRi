import 'dart:convert';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  List<String> bannerList;
  List<SpecificationList> specificationList;
  String contact;
  String goodsName;
  String brandName;
  String goodsSeries;
  String price;
  String supplierId;
  String supplierName;
  String supplierCode;
  String platformCode;
  String produceTime;
  String guidePrice;
  String miniBuyNum;
  String goodsImgUrl;

  DetailModel({
    required this.bannerList,
    required this.specificationList,
    required this.contact,
    required this.goodsName,
    required this.brandName,
    required this.goodsSeries,
    required this.price,
    required this.supplierId,
    required this.supplierName,
    required this.supplierCode,
    required this.platformCode,
    required this.produceTime,
    required this.guidePrice,
    required this.miniBuyNum,
    required this.goodsImgUrl,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        bannerList: List<String>.from(json["bannerList"].map((x) => x)),
        specificationList:
            List<SpecificationList>.from(json["specificationList"].map((x) => SpecificationList.fromJson(x))),
        contact: json["contact"],
        goodsName: json["goodsName"],
        brandName: json["brandName"],
        goodsSeries: json["goodsSeries"],
        price: json["price"],
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        supplierCode: json["supplierCode"],
        platformCode: json["platformCode"],
        produceTime: json["produceTime"],
        guidePrice: json["guidePrice"],
        miniBuyNum: json["miniBuyNum"],
        goodsImgUrl: json["goodsImgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "bannerList": List<dynamic>.from(bannerList.map((x) => x)),
        "specificationList": List<dynamic>.from(specificationList.map((x) => x.toJson())),
        "contact": contact,
        "goodsName": goodsName,
        "brandName": brandName,
        "goodsSeries": goodsSeries,
        "price": price,
        "supplierId": supplierId,
        "supplierName": supplierName,
        "supplierCode": supplierCode,
        "platformCode": platformCode,
        "produceTime": produceTime,
        "guidePrice": guidePrice,
        "miniBuyNum": miniBuyNum,
        "goodsImgUrl": goodsImgUrl,
      };
}

class SpecificationList {
  String name;
  List<String> specification;

  SpecificationList({
    required this.name,
    required this.specification,
  });

  factory SpecificationList.fromJson(Map<String, dynamic> json) => SpecificationList(
        name: json["name"],
        specification: List<String>.from(json["specification"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "specification": List<dynamic>.from(specification.map((x) => x)),
      };
}
