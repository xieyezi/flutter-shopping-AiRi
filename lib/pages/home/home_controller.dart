import 'package:AiRi/services/home.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_model.dart';

class HomeController extends GetxController {
  bool loading = true;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  List<String> banerList = [];
  List<BrandListElement> cateGoryList = [];
  List<BrandListElement> brandList = [];
  List<GoodsList> hotList = [];

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

    /// 初次加载
    banerList = res.banerList;
    cateGoryList = res.cateGoryList;
    brandList = res.brandList;
    hotList = res.hotList;
    loading = false;

    /// 下拉刷新
    if (refresh) {
      banerList = res.banerList;
      cateGoryList = res.cateGoryList;
      brandList = res.brandList;
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
