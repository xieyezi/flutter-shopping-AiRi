import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/main_provider.dart';

// tabBar数据B
const List<Map<String, String>> _tabBarData = [
  {
    "title": "首页",
    "image": "assets/images/tabbar/zhuye_off.png",
    "selectedImage": "assets/images/tabbar/zhuye_ON.png",
  },
  {
    "title": "分类",
    "image": "assets/images/tabbar/fenlei_off.png",
    "selectedImage": "assets/images/tabbar/fenlei_ON.png",
  },
  {
    "title": "订单",
    "image": "assets/images/tabbar/dingdan_off.png",
    "selectedImage": "assets/images/tabbar/diangdan_ON.png",
  },
  {
    "title": "我的",
    "image": "assets/images/tabbar/guanli_off.png",
    "selectedImage": "assets/images/tabbar/guanli_ON.png",
  }
];

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  MyBottomNavigationBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    /// 底部tabar 统一设置为 49 + 全面屏底部安全距离
    final bottomBarHeight = 49 + MediaQuery.of(context).padding.bottom + (Platform.isAndroid ? 2 : 0);
    return SizedBox(
      height: bottomBarHeight,
      child: _getBottomNavigationBar(context),
    );
  }

  /// bottomNavBar
  _getBottomNavigationBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Selector<MainProvider, int>(
            builder: (_, index, __) {
              return BottomNavigationBar(
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                unselectedItemColor: Color(0xff999999),
                selectedItemColor: Color(0xFF424242),
                backgroundColor: Color(0xfffefefe),
                elevation: 0,
                onTap: this.onTap,
                items: _getTabBar(context),
              );
            },
            selector: (_, model) => model.getTabBarSelectedIndex),
        Divider(
          height: 0.5,
          color: Color(0xffdfdfdf),
        ),
      ],
    );
  }
  // 8B63E6  9B9B9B

  List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
    var index = 0;
    return _tabBarData.map((item) {
      return _getBottomBarItem(
          item["title"], item["image"], item["selectedImage"], context, index++ == 3 ? _getBadge() : null);
    }).toList();
  }

  BottomNavigationBarItem _getBottomBarItem(String? title, String? image, String? selectedImage, BuildContext context,
      [Widget? badge]) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _tabBarIconWidth = _screenWidth / _tabBarData.length;
    const _tabBarIconHeight = 22.0;

    final _badge = Positioned(
      left: _tabBarIconWidth / 2 + 5,
      child: badge ?? Container(),
    );

    return BottomNavigationBarItem(
        icon: Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                image!,
                width: _tabBarIconWidth,
                height: _tabBarIconHeight,
              ),
              _badge,
            ],
          ),
        ),
        activeIcon: Stack(
          children: <Widget>[
            Image.asset(
              selectedImage!,
              width: _tabBarIconWidth,
              height: _tabBarIconHeight,
            ),
            _badge
          ],
        ),
        label: title);
  }

  _getBadge() {
    return Consumer<MainProvider>(
      builder: (context, MainProvider state, child) => Opacity(
        opacity: state.isMessageCount ? 1 : 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xfff8d949),
          ),
          height: 18,
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 6,
            ),
            child: Center(
              child: Text(
                state.getMessageCount,
                style: TextStyle(color: Colors.white, fontSize: 10.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
