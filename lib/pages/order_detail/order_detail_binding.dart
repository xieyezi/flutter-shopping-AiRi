import 'package:get/get.dart';
import 'order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<OrderDetailController>(() => OrderDetailController());
    }
}
