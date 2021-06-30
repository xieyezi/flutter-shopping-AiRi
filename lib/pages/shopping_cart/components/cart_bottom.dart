import 'package:AiRi/pages/confirm_order/confirm_order_view.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'package:get/get.dart';

import '../shopping_cart_controller.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomHeight = MediaQuery.of(context).padding.bottom; // 获取安全距离
    final ShoppingCartController state = Get.find();
    final selectAllGood = state.selectAllGood;
    final goodTotalNum = state.goodTotalNum;
    final goodTotalPrice = state.goodTotalPrice;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(bottom: bottomHeight),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFE8EAEB),
              width: 1.0,
            ),
          ),
        ),
        height: 60.0 + bottomHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => selectAllGood(),
                    child: state.isSelectAllGood
                        ? Image.asset(
                            'assets/images/shopping_cart/check.png',
                            width: 24.0,
                            height: 24.0,
                          )
                        : Image.asset(
                            'assets/images/shopping_cart/bottom_check.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                  ),
                  GestureDetector(
                    onTap: selectAllGood,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '全选',
                            style: TextStyle(
                              color: Color(0xFF18191A),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '数量  $goodTotalNum',
                            style: TextStyle(
                              color: Color(0xFF979899),
                              fontSize: 11.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            state.isEditMode
                ? Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: OutlineButton(
                      child: Text(
                        '删除 (' + goodTotalNum.toString() + ')',
                        style: TextStyle(
                          color: Color(0xFF17191A),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () => state.deteleGood(),
                    ),
                  )
                : Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 7.5),
                        child: Text(
                          '￥$goodTotalPrice',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.priceColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => MyNavigator.push(ConfirmOrderPage()),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              //背景径向渐变
                              colors: [AppColors.buttonLine1, AppColors.buttonLine2],
                            ),
                            borderRadius: BorderRadius.circular(1.0),
                          ),
                          width: 120.0,
                          height: 60.0,
                          child: Center(
                            child: Text(
                              '下单',
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
