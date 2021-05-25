import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/main/store/main_provider.dart';

class MyNavigator {
  // 设置一次 context 方便后面
  static late BuildContext ctx;

  // push 新页面
  static Future<T>? push<T extends Object>(Widget page, {BuildContext? context}) {
    final _ctx = context ?? ctx;
    FocusScope.of(_ctx).requestFocus(FocusNode());
    Navigator.of(_ctx).push(
      MaterialPageRoute(builder: (_ctx) => page),
    );
  }

  // pop 返回
  static pop<T extends Object>({BuildContext? context, T? data}) {
    final _ctx = context ?? ctx;
    return Navigator.pop(_ctx, data);
  }

  /// 返回根页面
  static void popToRoot({BuildContext? context}) {
    final _ctx = context ?? ctx;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// 返回首页
  static void popToHome({BuildContext? context}) {
    final _ctx = context ?? ctx;
    final mainProvder = Provider.of<MainProvider>(_ctx, listen: false);
    mainProvder.setTabBarSelectedIndex = 0;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// 返回并删除页面
  static void pushAndRemove(Widget page, {int removeCount = 1, BuildContext? context}) {
    var index = 0;
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) {
        index++;
        return index > removeCount ? true : false;
      },
    );
  }

  // iOS 从底部向上出来的页面
  static present(Widget page, {BuildContext? context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));
  }
}
