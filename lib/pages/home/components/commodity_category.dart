import 'package:AiRi/components/my_cahenetwork_image.dart';
import 'package:AiRi/pages/main/main_controller.dart';
import 'package:AiRi/pages/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'package:get/get.dart';
import '../../../styles/colors.dart';
import '../home_model.dart';

class CommodityCateGory extends StatelessWidget {
  final List<BrandListElement> cateGoryList;
  const CommodityCateGory({Key? key, required this.cateGoryList}) : super(key: key);

  ///////////////////////////////
  List<Widget> _buildGridItem(BuildContext context) {
    final MainController mainState = Get.find();

    List<Widget> gridItemList = [];
    for (int i = 0; i <= cateGoryList.length; i++) {
      gridItemList.add(
        GestureDetector(
          onTap: i == cateGoryList.length
              ? () => mainState.setTabBarSelectedIndex = 1
              //FIXME:title: cateGoryList[i].name, keyword: cateGoryList[i].name
              : () => MyNavigator.push(SearchPage()),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  padding: EdgeInsets.only(bottom: 12),
                  child: i == cateGoryList.length
                      ? Image.asset(
                          'assets/images/home/gengduofenlei.png',
                          fit: BoxFit.contain,
                        )
                      : MyCachedNetworkImage(
                          imageurl: cateGoryList[i].icon,
                        ),
                ),
                Text(
                  i == cateGoryList.length ? '更多分类' : cateGoryList[i].name,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return gridItemList;
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 350,
      width: _screenWidth - 30,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10, right: 15, bottom: 10, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 5.0,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: _buildGridItem(context),
      ),
    );
  }
}
