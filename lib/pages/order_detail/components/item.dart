import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/pages/supplier/supplier_page.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';

class OrderItem extends StatelessWidget {
  final orderItemData;
  const OrderItem({Key? key, this.orderItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
              Head(), // 头部
            ] +
            [1, 2, 3].map<Widget>((item) {
              return Content();
            }).toList(),
      ),
    );
  }
}

///顶部供应商
class Head extends StatelessWidget {
  const Head({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(SupplierPage(supplierId: "supplierId")),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '无印良品',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF121212),
                  ),
                ),
                SizedBox(width: 10.5),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF4A4A4A),
                  size: 20.0,
                ),
              ],
            ),
            Text(
              '待支付',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4A4A4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 订单内容
class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: Container(
              // color: Colors.red,
              child: CachedNetworkImage(
                placeholder: (_, __) =>
                    Image.asset('assets/images/order/jiazaizhong.png'),
                imageUrl:
                    'https://yanxuan.nosdn.127.net/dd9cd8d2dae44d4319ab21919021435b.png',
                height: 90,
                width: 90,
              ),
            ),
          ),
          Positioned(
            left: 125,
            right: 15,
            top: 16,
            child: Text(
              "客厅卧室单人沙发躺椅简易休闲榻榻米创意日式布艺小沙发",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF17191A)),
            ),
          ),
          Positioned(
            left: 125,
            top: 40,
            right: 15,
            child: Text(
              '暖灰色 单沙发舒适款90*110cm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAAB0B3)),
            ),
          ),
          Positioned(
            // 价格
            left: 125,
            top: 81.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 5),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '采购价',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            // 价格
            left: 175,
            top: 81.0,
            child: RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '2348',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
            ),
          ),
          Positioned(
            // 价格
            right: 20,
            top: 81.0,
            child: Text(
              'x2',
              style: TextStyle(
                color: Color(0xFF17191A),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
