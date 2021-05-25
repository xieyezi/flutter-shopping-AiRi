import 'package:flutter/material.dart';
import 'package:AiRi/styles/colors.dart';

class IntroductionAndConfiguration extends StatefulWidget {
  const IntroductionAndConfiguration({Key? key}) : super(key: key);

  @override
  _IntroductionAndConfigurationState createState() =>
      _IntroductionAndConfigurationState();
}

class _IntroductionAndConfigurationState
    extends State<IntroductionAndConfiguration> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  /// 上边tab
  Widget _buildTopTab() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              this.setState(() {
                _currentPage = 0;
                _pageController.animateToPage(
                  0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            },
            child: Container(
              height: 40,
              width: (MediaQuery.of(context).size.width - 30) / 2,
              color: _currentPage == 0
                  ? Colors.white
                  : AppColors.primaryBackground,
              child: Center(child: Text('商品介绍')),
            ),
          ),
          ClipPath(
            child: Container(
              width: 30,
              color: Colors.white,
            ),
            clipper:
                _currentPage == 0 ? MyClipperLeft() : MyClipperRight(), //裁剪
          ),
          GestureDetector(
            onTap: () {
              this.setState(() {
                _currentPage = 1;
                _pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            },
            child: Container(
              height: 40,
              width: (MediaQuery.of(context).size.width - 30) / 2,
              color: _currentPage == 1
                  ? Colors.white
                  : AppColors.primaryBackground,
              child: Center(child: Text('商品配置')),
            ),
          ),
        ],
      ),
    );
  }

  /// 下边内容
  Widget _buildBottomContent() {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          Container(
            child: Center(child: Text('商品介绍')),
          ),
          Container(
            child: Center(child: Text('商品配置')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 上边tab
        _buildTopTab(),
        // 下边内容
        _buildBottomContent(),
      ],
    );
  }
}

/// tab切换时左边裁剪
class MyClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //x坐标为0.0 y坐标为高度
    //x坐标为宽度 y坐标为高度 达到斜线的结果
    //完成
    var path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

/// tab切换时右边裁剪
class MyClipperRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // 将坐标轴的原点移动至宽度和高度处
    //x坐标为宽度，y坐标为0.0
    //x坐标为0.0，y坐标为高度
    //完成
    var path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
