import 'package:AiRi/components/components.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/components/left_title.dart';
import 'package:AiRi/model/home.dart';
import 'package:AiRi/pages/supplier/supplier_page.dart';
import 'package:AiRi/utils/my_navigator.dart';


class BrandSwiper extends StatelessWidget {
  final List<BrandListElement> brandList;
  const BrandSwiper({Key? key, required this.brandList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 7.5, right: 15, bottom: 7.5, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          LeftTitle(
            tipColor: AppColors.primaryColor,
            title: '品牌专场',
          ),
          Container(
            height: 90,
            padding: EdgeInsets.only(top: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brandList.length,
              itemBuilder: (context, index) {
                return _buildBrandItem(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

///////////////////////////////
  /// 每个品牌Item
  Widget _buildBrandItem(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () =>
          MyNavigator.push(SupplierPage(supplierId: brandList[index].name)),
      child: Container(
        padding: EdgeInsets.only(right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              padding: EdgeInsets.only(bottom: 12),
              child: MyCachedNetworkImage(
                imageurl: brandList[index].icon,
              ),
            ),
            Text(
              brandList[index].name,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
