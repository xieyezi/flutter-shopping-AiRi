import 'package:AiRi/pages/category/category_controller.dart';
import 'package:AiRi/pages/home/home_controller.dart';
import 'package:AiRi/pages/manage/manage_controller.dart';
import 'package:AiRi/pages/shopping_cart/shopping_cart_global_controller.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ManageController>(() => ManageController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ShoppingCartGlobalController>(() => ShoppingCartGlobalController());
  }
}
