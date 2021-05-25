import 'package:AiRi/components/components.dart';
import 'package:AiRi/pages/confirm_order/confirm_order.dart';
import 'package:AiRi/pages/supplier/supplier_page.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:AiRi/components/my_toast.dart';
import 'package:AiRi/pages/shopping_cart/cart_page.dart';
import 'package:AiRi/utils/my_navigator.dart';

class DetailBottom extends StatelessWidget {
  final String contact;
  const DetailBottom({Key? key, required this.contact}) : super(key: key);

  /// 左边的每个item
  Widget _buildleftItem(String imgUrl, String title) {
    return Column(
      children: <Widget>[
        Image.asset(
          imgUrl,
          width: 25.0,
          height: 25.0,
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  /// 右边
  Widget _buildRight() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => MyToast.show('成功加入购物车车~'),
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              // color: AppColors.addToCart,
              gradient: LinearGradient(
                //背景径向渐变
                colors: [AppColors.addToCart1, AppColors.addToCart2],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                '加入购物车',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => MyNavigator.push(ConfirmOrderPage()),
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //背景径向渐变
                colors: [AppColors.buyNow1, AppColors.buyNow2],
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                '立即购买',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _contact() async {
    final url = 'tel:' + contact;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  // 弹出对话框
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: '联系客服',
            titleStyle: TextStyle(
              color: Color(0xFF121212),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            content: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '联系电话：$contact',
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    ),
                  ),
                  Container(
                    child: Text(
                      '客服工作时间：工作日 9：30~17：30',
                      style:
                          TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: '拨打电话',
            isCancel: true,
            confirmTextColor: AppColors.buyNow1,
            confirmCallback: () {
              _contact();
            },
            dismissCallback: () {
              return;
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom, top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Color(0xffdfdfdf),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () => _showDialog(context),
                    child:
                        _buildleftItem('assets/images/home/lianxi.png', '客服')),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                    onTap: () =>
                        MyNavigator.push(SupplierPage(supplierId: 'id')),
                    child: _buildleftItem('assets/images/home/shop.png', '店铺')),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                    onTap: () => MyNavigator.push(CartPage()),
                    child: _buildleftItem(
                        'assets/images/home/gouwuche.png', '购物车')),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: _buildRight(),
          ),
        ],
      ),
    );
  }
}
