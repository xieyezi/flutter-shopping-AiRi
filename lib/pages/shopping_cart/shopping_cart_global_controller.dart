import 'package:get/get.dart';

class ShoppingCartGlobalController extends GetxController {
  final goodsCount = 5.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  String get goodsCountString {
    return goodsCount > 99 ? "99+" : goodsCount.toString();
  }
}
