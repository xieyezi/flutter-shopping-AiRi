
import 'package:AiRi/components/components.dart';
import 'package:AiRi/pages/pay/pay_page.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/pages/order_detail/components/address.dart';
import 'package:AiRi/pages/order_detail/components/delivery.dart';
import 'components/info.dart';
import 'components/item.dart';

class OrderDetailPage extends StatelessWidget {
  final String orderId;

  const OrderDetailPage({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => _showCancelDialog(context),
            child: Center(
              child: Text(
                '取消订单',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
      title: '订单详情',
      body: OrderDetailContainer(),
    );
  }

  // 弹出对话框
  void _showCancelDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: '',
            content: Center(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/order/querendingdan.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: 0.0, top: 20),
                    child: Text(
                      '取消订单',
                      style:
                          TextStyle(color: Color(0xFF4A4A4A), fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: '确定',
            cancelContent: '返回',
            isCancel: true,
            // confirmColor: Color(0xFFF5A623),
            confirmCallback: () {
              /// 取消订单操作
            },
            dismissCallback: () {
              return;
            },
          );
        });
  }
}

class OrderDetailContainer extends StatelessWidget {
  const OrderDetailContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
                bottom: 60 + MediaQuery.of(context).padding.bottom),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Address(),
                  OrderItem(),
                  OrderDetailInfo(),
                  Delivery(),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomButton(
              text: '去支付',
              handleOk: () => MyNavigator.push(PayPage(orderId: "id")),
            ),
          ),
        ],
      ),
    );
  }
}
