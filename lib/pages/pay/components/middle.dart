import 'package:flutter/material.dart';

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 32,
            child: Text(
              '支付渠道',
              style: TextStyle(
                color: Color(0xFF4A4A4A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: '微信支付',
            tip: '(已开放)',
            img: 'assets/images/pay/check.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: '支付宝',
            tip: '(未开放)',
            img: 'assets/images/pay/uncheck.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: '银联',
            tip: '(未开放)',
            img: 'assets/images/pay/uncheck.png',
          ),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildItem(
            title: '线下转账',
            tip: '(需上传支付凭证)',
            img: 'assets/images/pay/uncheck.png',
          ),
        ],
      ),
    );
  }

  /// 每一项
  Widget _buildItem({
    required String title,
    required String tip,
    required String img,
  }) {
    TextStyle greyText = TextStyle(
      color: Color(0xFFBEBEBE),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    TextStyle blackText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: title == '微信支付' ? blackText : greyText),
              Text(tip, style: greyText),
            ],
          ),
          Image.asset(img, width: 20, height: 20)
        ],
      ),
    );
  }
}
