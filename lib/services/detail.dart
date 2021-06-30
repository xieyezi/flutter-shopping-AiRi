import 'package:AiRi/pages/detail/detail_model.dart';
import 'package:AiRi/utils/request.dart';

/// 详情页面
class DetailAPI {
  /// 获取详情数据
  static Future<DetailModel> getData() async {
    var response = await RequestUtil().get('/detail');
    return DetailModel.fromJson(response);
  }
}
