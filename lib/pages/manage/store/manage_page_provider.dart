import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/model/home.dart';
import 'package:AiRi/services/services.dart';

class ManagePageProvider with ChangeNotifier {
  bool loading = true;
  List<GoodsList> hotList = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ManagePageProvider() {
    /// 首页数据加载
    initData();
  }
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
    notifyListeners();
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
    notifyListeners();
  }
}
