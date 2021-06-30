import 'package:AiRi/pages/main/main_controller.dart';
import 'package:get/get.dart';
import 'pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
