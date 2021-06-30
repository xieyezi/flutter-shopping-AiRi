import 'package:get/get.dart';
import 'supplier_controller.dart';

class SupplierBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SupplierController>(() => SupplierController());
    }
}
