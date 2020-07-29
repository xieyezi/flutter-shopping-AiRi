import 'package:AiRi/components/my_cahenetwork_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/model/home.dart';
import 'package:AiRi/pages/main/store/main_provider.dart';
import 'package:AiRi/pages/search/search_page.dart';
import 'package:AiRi/utils/my_navigator.dart';
import '../../../styles/colors.dart';

class CommodityCateGory extends StatelessWidget {
  final List<BrandListElement> cateGoryList;
  const CommodityCateGory({Key key, this.cateGoryList}) : super(key: key);

  ///////////////////////////////
  List<Widget> _buildGridItem(BuildContext context) {
    final mainProvder = Provider.of<MainProvider>(context, listen: false);

    List<Widget> gridItemList = [];
    for (int i = 0; i <= cateGoryList.length; i++) {
      gridItemList.add(
        GestureDetector(
          onTap: i == cateGoryList.length
              ? () => {mainProvder.setTabBarSelectedIndex = 1}
              : () => MyNavigator.push(SearchPage(
                  title: cateGoryList[i].name, keyword: cateGoryList[i].name)),
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
    final _containerHeight = _screenWidth <= 414 ? 228.0 : 108.0;
    final _crossAxisCount = _screenWidth <= 414 ? 4 : 8;
    final _childAspectRatio = (_screenWidth - 60) / _crossAxisCount / 128;
    return Container(
      height: _containerHeight,
      width: _screenWidth - 30,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 15, right: 15, bottom: 7.5, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 25.0,
        crossAxisCount: _crossAxisCount,
        childAspectRatio: _childAspectRatio,
        children: _buildGridItem(context),
      ),
    );
  }
}
