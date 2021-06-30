import 'package:get/get.dart';

class OrderController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    print(Get.arguments); //FIXME: orderId
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
