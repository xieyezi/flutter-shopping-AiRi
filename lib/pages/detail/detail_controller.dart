import 'package:AiRi/pages/detail/detail_model.dart';
import 'package:AiRi/services/detail.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
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

  @override
  void onInit() {
    print(Get.arguments); //FIXME: goodsId
    initData();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future initData() async {
    DetailModel res = await DetailAPI.getData();
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
    update();
  }
}
