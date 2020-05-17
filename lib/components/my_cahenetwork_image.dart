import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageurl;
  const MyCachedNetworkImage({Key key, this.imageurl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageurl,
      placeholder: (_, __) => Image.asset('assets/images/home/jiazaizhong.png'),
      fit: BoxFit.cover,
    );
  }
}
