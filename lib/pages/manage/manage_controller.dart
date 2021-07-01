import 'package:AiRi/pages/home/home_model.dart';
import 'package:AiRi/services/home.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManageController extends GetxController {
  bool loading = true;
  List<GoodsList> hotList = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future initData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList = res.hotList;
    loading = false;

    /// 下拉刷新
    if (refresh) {
      hotList = res.hotList;
      loading = false;
      refreshController.refreshCompleted();
    }
    update();
  }

  /// 上拉加载
  Future loadData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList += res.hotList;
    loading = false;
    if (hotList.length < 20) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    update();
  }
}
