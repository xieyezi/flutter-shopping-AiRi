
import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/model/goods.dart';
import 'package:AiRi/pages/home/components/brand_swiper.dart';
import 'package:AiRi/pages/home/components/commodity_category.dart';
import 'package:AiRi/pages/home/components/head_swiper.dart';
import 'package:AiRi/pages/home/store/home_page_provider.dart';
import 'package:AiRi/pages/main/components/preload_images.dart';
import 'package:AiRi/pages/search/search_page.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => HomePageProvider(),
      child: BaseScaffold(
        leadType: AppBarBackType.None,
        actions: <Widget>[AppBarShopCartIconButton()],
        title: '首页',
        centerTitle: true,
        body: HomePageContainer(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomePageProvider>(context);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: AppColors.primaryBackground,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SmartRefresher(
                controller: state.refreshController,
                enablePullUp: true,
                onRefresh: () => state.initData(refresh: true),
                onLoading: state.loadData,
                header: WaterDropMaterialHeader(),
                footer: MyCustomFooter(),
                child: CustomScrollView(
                  slivers: <Widget>[
                        // 预加载图片
                        SliverToBoxAdapter(
                          child: Container(
                            height: 0,
                            child: PreloadImages(),
                          ),
                        ),

                        /// 搜索框
                        SliverToBoxAdapter(
                          child: SearchBar(
                              myOntap: (value) => MyNavigator.push(
                                  SearchPage(title: '搜索', keyword: value))),
                        ),

                        /// 顶部轮播图
                        SliverToBoxAdapter(
                          child: HeadSwiper(
                            bannerList: state.banerList,
                          ),
                        ),

                        /// 商品分类区域
                        SliverToBoxAdapter(
                          child: CommodityCateGory(
                              cateGoryList: state.cateGoryList),
                        ),

                        /// 品牌轮播区域
                        SliverToBoxAdapter(
                          child: BrandSwiper(brandList: state.brandList),
                        ),

                        /// 热销商品区域
                      ] +
                      _hotCommodity(state.hotList),
                ),
              ),
            ),
          );
  }

  /// 热销商品区域
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: LeftTitle(
              tipColor: AppColors.primaryColor,
              title: '热销商品',
            )),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 10.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            direction: Axis.horizontal,
            children: hotList.map<Widget>(
              (item) {
                return CommdityItemHome(goodData: item);
              },
            ).toList(),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: null,
        ),
      ),
    ];
  }
}
