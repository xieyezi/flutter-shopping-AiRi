import 'package:flutter/material.dart';
import 'package:get/get.dart';

const URL = "app/conf";

class MainController extends GetxController {
  // PageController
  final PageController tabBarPageController = PageController(
    initialPage: 0,
  );
  // tabBar选中索引
  int _tabBarSelectedIndex = 0;
  int get getTabBarSelectedIndex => _tabBarSelectedIndex;

  int _messageCount = 0;
  // 处理后显示的消息
  String get getMessageCount => _messageCount < 100 ? _messageCount.toString() : "99+";
  // 是否有消息
  bool get isMessageCount => _messageCount > 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  set setTabBarSelectedIndex(int value) {
    tabBarPageController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    _tabBarSelectedIndex = value;
    update();
  }
}
