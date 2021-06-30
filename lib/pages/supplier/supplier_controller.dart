import 'package:AiRi/pages/home/home_model.dart';
import 'package:AiRi/services/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'supplier_model.dart';

class SupplierController extends GetxController {
  RefreshController refreshController = RefreshController(initialRefresh: false);
  bool loading = true;
  String supplierName = '';
  String contact = '';
  String phoneNum = '';
  String workTime = '';

  String supplierImgUrl = "";
  String introDuceText = '';

  List<GoodsList> supplierList = [];

  @override
  void onInit() {
    print(Get.arguments); //FIXME: supplierId
    initData();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future initData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierName = res.supplierName;
    contact = res.contact;
    phoneNum = res.phoneNum;
    workTime = res.workTime;
    supplierList = res.supplierList;
    supplierImgUrl = res.supplierImgUrl;
    introDuceText = res.introDuceText;
    loading = false;
    update();
  }

  /// 上拉加载
  Future loadData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierList += res.supplierList;
    loading = false;
    if (supplierList.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    update();
  }
}
