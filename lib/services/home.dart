import 'package:AiRi/model/home.dart';
import 'package:AiRi/utils/request.dart';

/// 首页
class HomeAPI {
  /// 获取首页数据
  static Future<HomeModel> getHomeData() async {
    var response = await RequestUtil().get('/index');
    return HomeModel.fromJson(response);
  }
}
