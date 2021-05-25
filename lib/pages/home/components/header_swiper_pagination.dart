import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:AiRi/styles/colors.dart';

class MyPaginationController {
  ValueNotifier<double> value = ValueNotifier(0);

  void setValue(double value) {
    this.value.value = value;
  }
}

class MyHomeBannerPagination extends StatelessWidget {
  // final double value;
  final int itemCount;
  final MyPaginationController controller;
  const MyHomeBannerPagination({Key? key, required this.itemCount, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, _) {
        // 滚动距离
        final scrollValue = value % 1 == 0 ? 1 : value % 1;
        // 当前索引
        final currentIndex = value.floor();
        // 下一个滚动缩影
        final nextIndex = value!.ceil() >= itemCount ? 0 : value.ceil();

        /// 1. 宽度处理
        // 默认宽度
        double defaultWidth = 10;
        // 当前 item 宽度
        final currentWidth = 10 + 10.0 * (1 - scrollValue);
        // 下一个 item 宽度
        final nextWidth = 10 + 10.0 * scrollValue;

        /// 2. 颜色处理
        Color defaultColor = Color(0xFFC6CBCE);
        final activateColor = AppColors.primaryColor;

        /// 颜色差值比例
        final differenceScale = (scrollValue == 1 ? 0 : scrollValue);

        /// 具体颜色差值
        final rDifference =
            ((defaultColor.red - activateColor.red) * differenceScale).toInt();
        final gDifference =
            ((defaultColor.green - activateColor.green) * differenceScale)
                .toInt();
        final bDifference =
            ((defaultColor.blue - activateColor.blue) * differenceScale)
                .toInt();

        final rEndDifference =
            ((activateColor.red - defaultColor.red) * (differenceScale))
                .toInt();
        final gEndDifference =
            ((activateColor.green - defaultColor.green) * (differenceScale))
                .toInt();
        final bEndDifference =
            ((activateColor.blue - defaultColor.blue) * (differenceScale))
                .toInt();

        final currentColor = Color.fromARGB(
          255,
          activateColor.red + rDifference,
          activateColor.green + gDifference,
          activateColor.blue + bDifference,
        );

        final nextColor = Color.fromARGB(
          255,
          defaultColor.red + rEndDifference,
          defaultColor.green + gEndDifference,
          defaultColor.blue + bEndDifference,
        );
        List<Widget> itemWidgets = [];
        for (var i = 0; i < itemCount; i++) {
          double width = defaultWidth;
          Color color = defaultColor;
          if (i == currentIndex) {
            width = currentWidth;
            color = currentColor;
          }
          if (i == nextIndex) {
            width = nextWidth;
            if (currentIndex != nextIndex) color = nextColor;
          }

          itemWidgets.add(Container(
            width: width,
            height: 5,
            margin: EdgeInsets.only(left: 2.5, right: 2.5),
            decoration: BoxDecoration(
                borderRadius: (BorderRadius.circular(5)), color: color),
          ));
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: itemWidgets,
        );
      },
      valueListenable: this.controller.value,
    );
  }
}

// 自定义分页效果
class MyCustomPagination extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];
    for (var i = 0; i < config.itemCount; i++) {
      if (i == config.activeIndex) {
        list.add(Container(
          width: 20,
          height: 5,
          margin: EdgeInsets.only(left: 2.5, right: 2.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Color(0xffF5A623)),
        ));
        continue;
      }
      list.add(Container(
        width: 10,
        height: 5,
        margin: EdgeInsets.only(left: 2.5, right: 2.5),
        decoration: BoxDecoration(
            borderRadius: (BorderRadius.circular(5)), color: Color(0xffC6CBCE)),
      ));
    }
    return Positioned(
        bottom: 5,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ));
  }
}
