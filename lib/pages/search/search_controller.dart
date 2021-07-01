import 'package:AiRi/pages/home/home_model.dart';
import 'package:AiRi/services/search.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'search_model.dart';

class SearchController extends GetxController {
  bool loading = true;
  List<GoodsList> result = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    print(Get.arguments);
    searchData(keyword: Get.arguments['keyword']);
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future searchData({bool refresh = false, required String keyword}) async {
    // print(keyword);
    loading = true;

    /// 这里keyword有存在空的情况，后期需要判断
    SearchModel res = await SearchAPI.searchData(keyword: keyword);

    /// 初次加载
    result = res.result;
    loading = false;

    /// 下拉刷新
    if (refresh) {
      refreshController.refreshCompleted();
    }
    update();
  }

  /// 上拉加载
  Future loadData({bool refresh = false, required String keyword}) async {
    SearchModel res = await SearchAPI.searchData(keyword: keyword);
    result += res.result;
    if (result.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    update();
  }
}
