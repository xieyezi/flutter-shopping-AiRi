import 'package:AiRi/pages/shopping_cart/shopping_cart_global_controller.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ShoppingCartGlobalController>(() => ShoppingCartGlobalController());
  }
}
