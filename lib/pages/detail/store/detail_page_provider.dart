/// detail provider
import 'package:flutter/foundation.dart';
import 'package:AiRi/model/detail.dart';
import 'package:AiRi/services/services.dart';

class DetailPageProvider with ChangeNotifier {
  bool loading = true;
  List<String> bannerList = [];
  String contact = '';
  String goodsName = '';
  String brandName = '';
  String goodsSeries = '';
  String price = '';
  String supplierId = '';
  String supplierName = '';
  String supplierCode = '';
  String platformCode = '';
  String produceTime = '';
  String guidePrice = '';
  String miniBuyNum = '';
  String goodsImgUrl = '';
  List<SpecificationList> specificationList = [];

  DetailPageProvider() {
    /// 数据加载
    initData();
  }

  Future initData() async {
    DetailModel res = await DetailAPI.getData();
    // print(res.specificationList);
    bannerList = res.bannerList;
    contact = res.contact;
    goodsName = res.goodsName;
    brandName = res.brandName;
    goodsSeries = res.goodsSeries;
    price = res.price;
    supplierId = res.supplierId;
    supplierName = res.supplierName;
    supplierCode = res.supplierCode;
    platformCode = res.platformCode;
    produceTime = res.produceTime;
    guidePrice = res.guidePrice;
    miniBuyNum = res.miniBuyNum;
    goodsImgUrl = res.goodsImgUrl;
    specificationList = res.specificationList;
    loading = false;
    notifyListeners();
  }
}
