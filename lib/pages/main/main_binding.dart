import 'package:AiRi/pages/category/category_controller.dart';
import 'package:AiRi/pages/home/home_controller.dart';
import 'package:AiRi/pages/manage/manage_controller.dart';
import 'package:AiRi/pages/shopping_cart/shopping_cart_global_controller.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ManageController>(() => ManageController(), fenix: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    Get.lazyPut<ShoppingCartGlobalController>(() => ShoppingCartGlobalController(), fenix: true);
  }
}
