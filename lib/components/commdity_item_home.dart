import 'package:AiRi/components/my_cahenetwork_image.dart';
import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/detail/detail_page.dart';
import 'package:AiRi/utils/my_navigator.dart';

class CommdityItemHome extends StatelessWidget {
  final GoodsList goodData;
  const CommdityItemHome({Key? key, required this.goodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(DetailPage(goodsId: goodData.goodsId)),
      child: Container(
        height: 240,
        width: (MediaQuery.of(context).size.width - 40) / 2,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 182,
              child: MyCachedNetworkImage(
                imageurl: goodData.goodsPicUrl,
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Text(
                goodData.goodsName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Text(
                '优衣库官方旗舰店',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.primaryGreyText,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Text(
                '¥${goodData.goodsMiniPrice}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.priceColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
