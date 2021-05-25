// import 'package:fluterdemo/model/goodList.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/shopping_cart/store/shopping_cart_provider.dart';

class CartItem extends StatelessWidget {
  // 取出每个品牌的数据
  final BrandItem brandData;
  final int brandIndex;
  final bool isShowCheckButton; // 是否显示选择按钮

  const CartItem({
    Key? key,
    required this.brandData,
    required this.brandIndex,
    this.isShowCheckButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 取出方法
    final selectBrandAllGood = Provider.of<ShopingCartProvider>(context, listen: false).selectBrandAllGood;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
              Head(
                brandData: brandData,
                selectedAllGood: () => selectBrandAllGood(brandIndex),
                isShowCheckButton: isShowCheckButton,
              ), // 头部
            ] +
            brandData.brandList.map<Widget>((GoodItem item) {
              return Content(
                goodData: item,
                isShowCheckButton: isShowCheckButton,
              );
            }).toList(),
      ),
    );
  }
}

class Head extends StatelessWidget {
  final BrandItem brandData;
  final Function selectedAllGood;
  final bool isShowCheckButton; // 是否显示选择按钮
  const Head({
    Key? key,
    required this.brandData,
    required this.selectedAllGood,
    this.isShowCheckButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          height: 62.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: isShowCheckButton,
                    child: GestureDetector(
                      onTap: () => selectedAllGood,
                      child: brandData.isBrandChecked
                          ? Image.asset(
                              'assets/images/shopping_cart/check.png',
                              width: 20.0,
                              height: 36.0,
                            )
                          : Image.asset(
                              'assets/images/shopping_cart/check_un.png',
                              width: 20.0,
                              height: 36.0,
                            ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          visible: isShowCheckButton,
                          child: Text(
                            brandData.brandName,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF17191A),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              isShowCheckButton
                                  ? (Image.asset(
                                      'assets/images/shopping_cart/icon-sj-26.png',
                                      height: 13.0,
                                      width: 13.0,
                                    ))
                                  : (Image.asset(
                                      'assets/images/shopping_cart/icon-sj-26.png',
                                      height: 20.0,
                                      width: 20.0,
                                    )),
                              Visibility(
                                visible: !isShowCheckButton,
                                child: SizedBox(width: 5),
                              ),
                              Text(
                                brandData.brandCompany,
                                style: isShowCheckButton
                                    ? TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFAAB0B3),
                                      )
                                    : TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF17191A),
                                      ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    brandData.brandSendByself
                        ? Container(
                            decoration: BoxDecoration(
                              color: AppColors.deliveryBackColor1,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            margin: EdgeInsets.only(right: 5.0),
                            padding: EdgeInsets.only(top: 2.0, right: 5.0, bottom: 2.0, left: 5.0),
                            child: Text(
                              '自提',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.deliveryColor1,
                              ),
                            ),
                          )
                        : Container(),
                    brandData.brandSendBySend
                        ? Container(
                            decoration: BoxDecoration(
                              color: AppColors.deliveryBackColor2,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            margin: EdgeInsets.only(right: 5.0),
                            padding: EdgeInsets.only(top: 2.0, right: 5.0, bottom: 2.0, left: 5.0),
                            child: Text(
                              '物流',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.deliveryColor2,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: Color(0xffdfdfdf), height: 1, indent: 10, endIndent: 10),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final GoodItem goodData;
  final bool isShowCheckButton; // 是否显示选择按钮
  const Content({
    Key? key,
    required this.goodData,
    this.isShowCheckButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 取出方法
    final selectSingleGood = Provider.of<ShopingCartProvider>(context, listen: false).selectSingleGood;
    final addOneGoodItem = Provider.of<ShopingCartProvider>(context, listen: false).addOneGoodItem;
    return Container(
      height: 142.0,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 40,
            child: Visibility(
              visible: isShowCheckButton,
              child: GestureDetector(
                onTap: () => selectSingleGood(goodData),
                child: goodData.goodIsChecked
                    ? Image.asset(
                        'assets/images/shopping_cart/check.png',
                        width: 20.0,
                        height: 40.0,
                      )
                    : Image.asset(
                        'assets/images/shopping_cart/check_un.png',
                        width: 20.0,
                        height: 40.0,
                      ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 15,
            child: Container(
              child: CachedNetworkImage(
                imageUrl: goodData.good.imageUrl,
                height: 90,
                width: 90,
              ),
            ),
          ),
          Positioned(
            left: 140,
            right: 23.5,
            top: 16,
            child: Text(
              goodData.good.goodsName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFF17191A)),
            ),
          ),
          Positioned(
            left: 140,
            top: 40,
            right: 23.5,
            child: Text(
              goodData.good.goodsDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400, color: Color(0xFFAAB0B3)),
            ),
          ),
          goodData.isBiggerQuantity
              ? Positioned(
                  // 价格
                  left: 140,
                  top: 83.5,
                  child: Text(
                    '￥' + goodData.good.price.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF17191A),
                    ),
                  ),
                )
              : Positioned(
                  // 超出库存
                  left: 140,
                  top: 83.5,
                  child: Text(
                    '超出库存',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE61717),
                    ),
                  ),
                ),
          Positioned(
            // 价格
            left: 140,
            top: 112.0,
            child: Text(
              '剩余库存：' + goodData.good.stockQuantity.toString(),
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFFAAB0B3),
              ),
            ),
          ),
          Positioned(
            height: 30,
            width: 180,
            bottom: 36,
            right: 0,
            child: Container(
//              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => addOneGoodItem(goodData, -1),
                    child: Image.asset(
                      goodData.count == 1
                          ? 'assets/images/shopping_cart/down1.png'
                          : 'assets/images/shopping_cart/down.png',
                      width: 36.0,
                      height: 28.0,
                    ),
                  ),
                  Container(
                    width: 45.0,
                    height: 28.0,
                    color: Color(0xFFF5F7F7),
                    child: Center(
                      child: Text(
                        goodData.count.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF17191A),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => addOneGoodItem(goodData, 1),
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/shopping_cart/up.png',
                        width: 36.0,
                        height: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
