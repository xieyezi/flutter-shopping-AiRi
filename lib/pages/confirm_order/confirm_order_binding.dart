import 'package:AiRi/pages/shopping_cart/shopping_cart_controller.dart';
import 'package:get/get.dart';
import 'confirm_order_controller.dart';

class ConfirmOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmOrderController>(() => ConfirmOrderController());
    Get.lazyPut<ShoppingCartController>(() => ShoppingCartController());
  }
}
