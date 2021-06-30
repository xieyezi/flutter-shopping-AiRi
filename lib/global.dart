import 'dart:io';

import 'package:AiRi/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 全局配置
class Global {
  /// 是否登录
  static bool isLogin = false;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    // 本地存储初始化
    await LoacalStorage.init();

    isLogin = LoacalStorage().getBool('STORAGE_DEVICE_ALREADY_LOGIN_KEY');

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
