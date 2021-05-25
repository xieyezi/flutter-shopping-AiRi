import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:AiRi/pages/shopping_cart/store/shopping_cart_provider.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'components/cart_bottom.dart';
import 'components/cart_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _provider = ShopingCartProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _provider,
      child: BaseScaffold(
        title: '购物车',
        actions: <Widget>[
          Selector<ShopingCartProvider, Tuple2<Function, bool>>(
            builder: (_, tuple, __) {
              return IconButton(
                icon: Text(
                  tuple.item2 ? '完成' : '编辑',
                  style: TextStyle(color: AppColors.primaryGreyText, fontSize: 14, fontWeight: FontWeight.w400),
                ),
                onPressed: () => tuple.item1(),
              );
            },
            selector: (_, provider) => Tuple2(provider.changeEditMode, provider.isEditMode),
          ),
        ],
        body: CartContainer(),
      ),
    );
  }
}

class CartContainer extends StatelessWidget {
  const CartContainer({Key? key}) : super(key: key);
  Widget _listItemBuilder(BuildContext context, int index) {
    // 取出数据
    final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
    return Container(
      color: Color(0xFFF5F7F7),
      padding: EdgeInsets.all(10.0),
      child: CartItem(brandData: brandList[index], brandIndex: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 取出数据
    final brandList = Provider.of<ShopingCartProvider>(context).getBrandList;
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
