import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'components/bottom.dart';
import 'components/order_item.dart';
import 'components/top.dart';

class ConfirmOrderPage extends StatelessWidget {
  const ConfirmOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopingCartProvider()),
      ],
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        title: '确认订单',
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ConfirmOrderPageContainer(),
        ),
      ),
    );
  }
}

class ConfirmOrderPageContainer extends StatelessWidget {
  const ConfirmOrderPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List orderList = [1, 1]; // 订单列表
    return Container(
      color: Color(0xFFF7F7F7),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(
                bottom: 70 + MediaQuery.of(context).padding.bottom),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Top(),
                  _buildOrderList(context, orderList: orderList),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Bottom(),
          ),
        ],
      ),
    );
  }

  /// 订单列表
  Widget _buildOrderList(BuildContext context, {required List orderList}) {
    // final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    // print(brandList);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: orderList.map((item) {
          return OrderItem();
        }).toList(),
      ),
    );
  }
}
