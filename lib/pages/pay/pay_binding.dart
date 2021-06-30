import 'package:get/get.dart';
import 'pay_controller.dart';

class PayBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<PayController>(() => PayController());
    }
}
