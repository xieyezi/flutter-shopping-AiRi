import 'package:get/get.dart';
import 'choose_address_controller.dart';

class ChooseAddressBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ChooseAddressController>(() => ChooseAddressController());
    }
}
