import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class DetailHeadSwiper extends StatelessWidget {
  final List<String> bannerList;
  const DetailHeadSwiper({Key? key, required this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      color: Colors.white,
      child: Swiper(
        loop: false,
        autoplay: false,
        duration: 600,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: CachedNetworkImage(
              imageUrl: bannerList[index],
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: bannerList.length,
        pagination: MyCustomPagination(),
      ),
    );
  }
}

// 自定义分页效果
class MyCustomPagination extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Container(
      child: Positioned(
        bottom: 10,
        right: 10,
        child: Container(
          height: 25,
          width: 35,
          decoration: BoxDecoration(
            color: Color.fromRGBO(39, 39, 39, 0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  (config.activeIndex + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '/',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  config.itemCount.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
