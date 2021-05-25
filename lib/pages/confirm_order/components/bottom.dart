import 'package:AiRi/components/components.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/pages/order_detail/order_detail_page.dart';
import 'package:AiRi/utils/my_navigator.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  // 弹出对话框
  void _showCancelDialog(BuildContext context) async {
    MyDialog.showLoading('提交中...', barrier: true);
    await Future.delayed(Duration(seconds: 3), () {});
    MyDialog.hideLoading();

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            content: Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/confirm_order/dingdanchenggong.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.0, top: 10),
                    child: Text(
                      '订单提交成功',
                      style: TextStyle(color: Color(0xFF4A4A4A), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: '查看订单',
            confirmTextColor: AppColors.buyNow1,
            cancelContent: '继续采购',
            isCancel: true,
            confirmCallback: () {
              /// 查看订单
              MyNavigator.pushAndRemove(OrderDetailPage(orderId: "dd"));
            },
            dismissCallback: () {
              /// 继续采购
              MyNavigator.popToHome();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle bottomPriceText = TextStyle(
      color: AppColors.priceColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
    TextStyle bottomRightText = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 60 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom, top: 0),
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
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 128,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            child: Text('￥15900', style: bottomPriceText),
          ),
          GestureDetector(
            onTap: () => _showCancelDialog(context),
            child: Container(
              width: 128,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  //背景径向渐变
                  colors: [AppColors.buttonLine1, AppColors.buttonLine2],
                ),
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: Center(child: Text('提交订单', style: bottomRightText)),
            ),
          ),
        ],
      ),
    );
  }
}
