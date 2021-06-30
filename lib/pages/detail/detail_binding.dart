import 'package:get/get.dart';
import 'detail_controller.dart';

class DetailBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
    }
}
