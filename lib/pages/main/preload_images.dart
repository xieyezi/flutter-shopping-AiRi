import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/* 预加载必须图片-可以解决首次点击闪烁问题(一般人也看不出来，洁癖专用) */
class PreloadImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: <Widget>[
        Image.memory(kTransparentImage),
        Image.asset('assets/images/tabbar/zhuye_off.png'),
        Image.asset('assets/images/tabbar/fenlei_ON.png'),
        Image.asset('assets/images/tabbar/diangdan_ON.png'),
        Image.asset('assets/images/tabbar/guanli_ON.png'),
      ],
    );
  }
}
