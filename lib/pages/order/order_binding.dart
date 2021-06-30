import 'package:get/get.dart';
import 'order_controller.dart';

class OrderBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
    }
}
