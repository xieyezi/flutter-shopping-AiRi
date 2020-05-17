import 'package:AiRi/model/category.dart';
import 'package:AiRi/utils/request.dart';

/// 分类页面
class CateGoryAPI {
  /// 获取分类数据
  static Future<CateGoryModel> getData() async {
    var response = await RequestUtil().get('/category');
    return CateGoryModel.fromJson(response);
  }
}
