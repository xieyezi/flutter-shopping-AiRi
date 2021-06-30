import 'package:AiRi/pages/main/main_controller.dart';
import 'package:get/get.dart';
import 'order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
