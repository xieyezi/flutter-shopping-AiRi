import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'header_swiper_pagination.dart';

class HeadSwiper extends StatefulWidget {
  final List<String> bannerList;
  const HeadSwiper({Key key, this.bannerList}) : super(key: key);

  @override
  _HeadSwiperState createState() => _HeadSwiperState();
}

class _HeadSwiperState extends State<HeadSwiper> {
  @override
  void initState() {
    super.initState();
  }

  MyPaginationController _controller = MyPaginationController();

  @override
  Widget build(BuildContext context) {
    // print('_HeadSwiperState-build');
    final count = widget.bannerList.length;
    return Container(
      height: 135.0 + 30,
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      color: Colors.white,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          final metrics = notification.metrics;
          final width = metrics.viewportDimension;
          // 计算当面页数
          final value = metrics.pixels % 1e8 / width % count;
          // 更新分页
          _controller.setValue(value);
          return true;
        },
        child: Stack(children: <Widget>[
          Swiper(
            autoplay: true,
            autoplayDelay: 4000,
            duration: 750,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 135,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: MyCachedNetworkImage(
                    imageurl: widget.bannerList[index],
                  ),
                ),
              );
            },
            itemCount: widget.bannerList.length,
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: MyHomeBannerPagination(
              controller: _controller,
              itemCount: widget.bannerList.length,
            ),
          ),
        ]),
      ),
    );
  }
}
