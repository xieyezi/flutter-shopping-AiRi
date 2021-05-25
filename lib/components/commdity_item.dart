import 'package:AiRi/components/my_cahenetwork_image.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/detail/detail_page.dart';

import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';

class CommdityItem extends StatelessWidget {
  final GoodsList goodData;
  const CommdityItem({Key? key, required this.goodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => MyNavigator.push(DetailPage(goodsId: goodData.goodsId)),
      child: Container(
        height: 140,
        // color: Colors.red,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              top: 4.5,
              width: 120,
              height: 130,
              child: MyCachedNetworkImage(
                imageurl: goodData.goodsPicUrl,
              ),
            ),
            Positioned(
              left: 149.0,
              top: 10,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Text(
                  goodData.goodsName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 57,
              child: Text(
                '优衣库官方旗舰店',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 83.5,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '指导零售价',
                      style: TextStyle(
                        color: AppColors.primaryGreyText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      goodData.goodsMiniPrice,
                      style: TextStyle(
                        color: AppColors.primaryGreyText,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 149.0,
              top: 105,
              child: Container(
                width: MediaQuery.of(context).size.width - 210.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '采购价',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '￥' + goodData.goodsMiniPrice,
                      style: TextStyle(
                        color: AppColors.priceColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
