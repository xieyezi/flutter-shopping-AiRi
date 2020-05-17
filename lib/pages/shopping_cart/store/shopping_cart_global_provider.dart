import 'package:flutter/widgets.dart';

class ShopingCartGlobalProvider with ChangeNotifier {
  int get goodsCount {
    return 5;
  }

  String get goodsCountString {
    return goodsCount > 99 ? "99+" : goodsCount.toString();
  }
}
