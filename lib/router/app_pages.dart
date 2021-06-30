import 'package:AiRi/pages/category/category_binding.dart';
import 'package:AiRi/pages/category/category_view.dart';
import 'package:AiRi/pages/choose_address/choose_address_binding.dart';
import 'package:AiRi/pages/choose_address/choose_address_view.dart';
import 'package:AiRi/pages/confirm_order/confirm_order_binding.dart';
import 'package:AiRi/pages/confirm_order/confirm_order_view.dart';
import 'package:AiRi/pages/detail/detail_view.dart';
import 'package:AiRi/pages/home/home_binding.dart';
import 'package:AiRi/pages/home/home_view.dart';
import 'package:AiRi/pages/login/login_page.dart';
import 'package:AiRi/pages/main/main_binding.dart';
import 'package:AiRi/pages/main/main_view.dart';
import 'package:AiRi/pages/manage/manage_binding.dart';
import 'package:AiRi/pages/manage/manage_view.dart';
import 'package:AiRi/pages/notfound/notfound_view.dart';
import 'package:AiRi/pages/order/order_binding.dart';
import 'package:AiRi/pages/order/order_view.dart';
import 'package:AiRi/pages/order_detail/order_detail_binding.dart';
import 'package:AiRi/pages/order_detail/order_detail_view.dart';
import 'package:AiRi/pages/pay/pay_binding.dart';
import 'package:AiRi/pages/pay/pay_view.dart';
import 'package:AiRi/pages/search/search_binding.dart';
import 'package:AiRi/pages/search/search_view.dart';
import 'package:AiRi/pages/shopping_cart/shopping_cart_binding.dart';
import 'package:AiRi/pages/shopping_cart/shopping_cart_view.dart';
import 'package:AiRi/pages/supplier/supplier_binding.dart';
import 'package:AiRi/pages/supplier/supplier_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Main;

  static final routes = [
    GetPage(
      name: AppRoutes.Main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: AppRoutes.ChooseAddress,
      page: () => ChooseAddress(),
      binding: ChooseAddressBinding(),
    ),
    GetPage(
      name: AppRoutes.ConfirmOrder,
      page: () => ConfirmOrderPage(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.Detail,
      page: () => DetailPage(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.Detail,
      page: () => ManagePage(),
      binding: ManageBinding(),
    ),
    GetPage(
      name: AppRoutes.OrderList,
      page: () => OrderPage(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: AppRoutes.OrderDetail,
      page: () => OrderDetailPage(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.Pay,
      page: () => PayPage(),
      binding: PayBinding(),
    ),
    GetPage(
      name: AppRoutes.Search,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.ShoppingCart,
      page: () => CartPage(),
      binding: ShoppingCartBinding(),
    ),
    GetPage(
      name: AppRoutes.Supplier,
      page: () => SupplierPage(),
      binding: SupplierBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );
}
