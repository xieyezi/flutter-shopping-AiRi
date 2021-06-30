import 'package:AiRi/services/category.dart';
import 'package:get/get.dart';
import 'category_model.dart';

class CategoryController extends GetxController {
  final loading = true.obs;
  late List<CategoryDatum> categoryData;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  Future initData() async {
    CateGoryModel res = await CateGoryAPI.getData();
    // 加载数据
    categoryData = res.categoryData;
    loading.value = false;
    update();
  }
}
