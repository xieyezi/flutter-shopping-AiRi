import 'dart:io';
import 'package:AiRi/pages/shopping_cart/shopping_cart_global_controller.dart';
import 'package:AiRi/pages/shopping_cart/shopping_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AiRi/utils/my_navigator.dart';

class AppBarShopCartIconButton extends StatelessWidget {
  const AppBarShopCartIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppingCartGlobalController state = Get.find();

    return IconButton(
      padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
      icon: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset('assets/images/home/gouwuche.png', width: 22, height: 22),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Visibility(
                visible: state.goodsCountString != "0",
                child: _badgeWidget(state.goodsCountString),
              ),
            )
          ],
        ),
      ),
      onPressed: () => MyNavigator.push(CartPage()),
    );
  }

  Container _badgeWidget(String count) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1.5, color: Colors.white),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 14),
        child: Container(
          height: 14,
          padding: EdgeInsets.only(left: 4, right: 4, bottom: Platform.isIOS ? 1 : 0),
          decoration: BoxDecoration(
            color: Color(0xFFB80821),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              count,
              style: TextStyle(color: Colors.white, fontSize: 9),
            ),
          ),
        ),
      ),
    );
  }
}
