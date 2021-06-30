import 'package:get/get.dart';
import 'search_controller.dart';

class SearchBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
    }
}
