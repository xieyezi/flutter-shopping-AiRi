import 'package:AiRi/pages/search/search_model.dart';
import 'package:AiRi/utils/request.dart';

/// 搜索页面
class SearchAPI {
  /// 搜索数据
  static Future<SearchModel> searchData({required String keyword}) async {
    var response = await RequestUtil().get(
      '/search',
      params: {"keyword": keyword},
    );
    return SearchModel.fromJson(response);
  }
}
