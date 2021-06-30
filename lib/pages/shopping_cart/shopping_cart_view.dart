import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'package:get/get.dart';
import 'components/cart_bottom.dart';
import 'components/cart_item.dart';
import 'shopping_cart_controller.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ShoppingCartController state = Get.find();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '购物车',
      actions: <Widget>[
        IconButton(
          icon: Text(
            state.isEditMode ? '完成' : '编辑',
            style: TextStyle(color: AppColors.primaryGreyText, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          onPressed: () => state.changeEditMode(),
        )
      ],
      body: CartContainer(),
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({Key? key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    final ShoppingCartController state = Get.find();
    final brandList = state.getBrandList;

    return Container(
      color: Color(0xFFF5F7F7),
      padding: EdgeInsets.all(10.0),
      child: CartItem(brandData: brandList[index], brandIndex: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ShoppingCartController state = Get.find();
    final brandList = state.getBrandList;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 80.0),
          color: Color(0xFFF5F7F7),
          child: brandList.length == 0
              ? Empty(
                  img: 'assets/images/shopping_cart/empty.png',
                  tipText: '购物车为空，快去采购吧~',
                  buttonText: '去采购',
                  buttonTap: () => MyNavigator.popToHome(),
                )
              : ListView.builder(
                  itemCount: brandList.length,
                  itemBuilder: _listItemBuilder,
                ),
        ),
        CartBottom(),
      ],
    );
  }
}
