import 'package:flutter/foundation.dart';
import 'package:AiRi/model/category.dart';
import 'package:AiRi/services/services.dart';

class CateGoryPageProvider with ChangeNotifier {
  bool loading = true;
  late List<CategoryDatum> categoryData;

  CateGoryPageProvider() {
    /// 数据加载
    initData();
  }

  Future initData() async {
    CateGoryModel res = await CateGoryAPI.getData();

    /// 加载数据
    categoryData = res.categoryData;
    loading = false;
    notifyListeners();
  }
}
