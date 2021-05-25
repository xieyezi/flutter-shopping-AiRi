import 'package:flutter/material.dart';
import 'package:AiRi/model/goods.dart';

import 'commdity_item.dart';
import 'my_divider.dart';

class GoodList extends StatelessWidget {
  final List<GoodsList> goodsList;
  const GoodList({Key? key, required this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: goodsList.length,
      itemBuilder: (context, index) {
        return CommdityItem(goodData: goodsList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return MyDivider();
      },
    );
  }
}
