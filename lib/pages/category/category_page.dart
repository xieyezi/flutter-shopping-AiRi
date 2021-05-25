import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AiRi/pages/category/store/category_page_provider.dart';
import 'package:AiRi/pages/search/search_page.dart';
import 'package:AiRi/utils/my_navigator.dart';
import 'components/menue.dart';
import 'components/right_list_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CateGoryPageProvider(),
      child: BaseScaffold(
        leadType: AppBarBackType.None,
        actions: <Widget>[AppBarShopCartIconButton()],
        title: '分类',
        body: Category(),
      ),
    );
  }
}

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<Category> with AutomaticKeepAliveClientMixin {
  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey = new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey = new GlobalKey<CategoryMenueState>();

  bool isAnimating = false;
  int itemCount = 0;
  late double menueWidth;
  late double itemHeight;
  late double height;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top; // 顶部状态栏高度
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom; // 底部状态栏高度
    final double scafoldHeight = 44; // Scafold高度
    final double searchBarHeight = 49; // 搜索框的高度
    final double bottomTabbarHeight = 49; // 底部tabBar的高度
    final double rightListViewHeight = MediaQuery.of(context).size.height -
        statusBarHeight -
        bottomBarHeight -
        scafoldHeight -
        searchBarHeight -
        bottomTabbarHeight;
    // final double rightListViewHeight = 600;
    final state = Provider.of<CateGoryPageProvider>(context);
    // List<SubCategoryListModel> listViewData = [];
    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: Color(0xFFFFFFFF),
            child: Column(
              children: <Widget>[
                SearchBar(
                  myOntap: (value) => MyNavigator.push(SearchPage(title: '搜索', keyword: value)),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Container(
                          color: Color(0xFFf7f7f7),
                          width: 100,
                          child: CategoryMenue(
                              key: categoryMenueKey,
                              items: state.categoryData.map((i) {
                                return i.name;
                              }).toList(),
                              itemHeight: 60,
                              itemWidth: 80,
                              menueTaped: menueItemTap),
                        ),
                      ),
                      RightListView(
                          key: rightListviewKey,
                          height: rightListViewHeight,
                          dataItems: state.categoryData,
                          listViewChanged: listViewChanged)
                    ],
                  ),
                )
              ],
            ));
  }

  menueItemTap(int i) {
    rightListviewKey.currentState!.jumpTopage(i);
  }

  listViewChanged(i) {
    this.categoryMenueKey.currentState!.moveToTap(i);
  }

  @override
  bool get wantKeepAlive => true;
}
