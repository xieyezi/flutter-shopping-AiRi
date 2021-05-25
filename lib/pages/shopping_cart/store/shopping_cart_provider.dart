import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:AiRi/components/my_toast.dart';

class ShopingCartProvider with ChangeNotifier {
  /// 是否选中全部商品
  bool _isSelectAllGood = false;

  /// 选中的商品数量
  int _goodTotalNum = 0;

  /// 选中的商品的总价格
  int _goodTotalPrice = 0;

  /// 是否为编辑模式
  bool isEditMode = false;

  ShopingCartProvider() {
    changeBrandState();
    changeBottomState();
  }

  /// 品牌列表
  List<BrandItem> _brandList = [
    BrandItem(
      brandName: '优衣库',
      brandCompany: '优衣库服饰有限公司',
      brandSendByself: true,
      brandSendBySend: true,
      isBrandChecked: false,
      brandList: [
        GoodItem(
          goodIsChecked: false,
          good: getOneGood1(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: true,
          good: getOneGood1(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: false,
          good: getOneGood1(),
          count: 1,
        ),
      ],
    ),
    BrandItem(
      brandName: '无印良品',
      brandCompany: '无印良品商贸有限公司',
      brandSendByself: false,
      brandSendBySend: true,
      isBrandChecked: false,
      brandList: [
        GoodItem(
          goodIsChecked: true,
          good: getOneGood2(),
          count: 1,
        ),
        GoodItem(
          goodIsChecked: false,
          good: getOneGood2(),
          count: 1,
        ),
      ],
    ),
  ];

  /// 获取_brandList
  List<BrandItem> get getBrandList => this._brandList;

  /// 获取_isSelectAllGood
  bool get isSelectAllGood => this._isSelectAllGood;

  int get goodTotalNum => this._goodTotalNum;

  int get goodTotalPrice => this._goodTotalPrice;

  /*
   * @item GoodItem
   * 选择单个商品，
   * 先改变GoodItem自身的状态，
   * 再改变父BrandItem的状态，
   * 接着改变底部bottom的状态
   */
  void selectSingleGood(GoodItem item) {
    item.goodIsChecked = !item.goodIsChecked; // 改变自身的状态
    Future.microtask(() {
      changeBrandState(); // 改变父BrandItem的状态
      changeBottomState(); // 改变底部bottom的状态
    });
  }

  /*
   * @index BrandItem
   * 选择某个BrandItem下面所有的商品
   * 先改变自身BrandItem的状态
   * 再改变BrandItem下面所有商品的状态
   * 接着改变底部bottom的状态
   */
  void selectBrandAllGood(int index) {
    this._brandList[index].isBrandChecked = !this._brandList[index].isBrandChecked; // 改变自身的状态
    this
        ._brandList[index]
        .brandList
        .forEach((item) => item.goodIsChecked = this._brandList[index].isBrandChecked); // 改变BrandItem下面所有商品的状态
    Future.microtask(() {
      changeBottomState(); // 改变底部bottom的状态
    });
  }

  /*
   * 当单选某项商品时，该项商品状态变更之后，再改变父BrandItem的状态
   */
  changeBrandState() {
    this._brandList.forEach((item) => {item.isBrandChecked = item.brandList.any((item) => item.goodIsChecked)});
  }

  /*
   * 当单选某项商品时，该项商品状态变更之后，再改变底部bottom的状态
   */
  void changeBottomState() {
    this._isSelectAllGood = this.getBrandList.every((item) {
      return item.brandList.every((item) => item.goodIsChecked);
    });
    this._goodTotalNum = 0;
    this._goodTotalPrice = 0;
    this._brandList.forEach((brandItem) => brandItem.brandList.forEach((item) {
          if (item.goodIsChecked) {
            this._goodTotalNum += item.count;
            this._goodTotalPrice += item.getTotalMoney();
          }
        }));
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*
   * 点击底部bottom的全选按钮
   * 先变更自身_isSelectAllGood的状态
   * 再变更每个brandItem的状态以及下面每个商品的状态
   */
  void selectAllGood() {
    this._isSelectAllGood = !this._isSelectAllGood; // 变更自身_isSelectAllGood的状态
    this._brandList.forEach((item) {
      item.isBrandChecked = this._isSelectAllGood; // 再变更每个brandItem的状态
      item.brandList.forEach((item) => item.goodIsChecked = this._isSelectAllGood); // 再变更每个brandItem下面每个商品的状态
    });
    Future.microtask(() {
      changeBottomState(); // 改变底部bottom的状态
    });
  }

  void addOneGoodItem(GoodItem item, int value) {
    item.count += value;
    if (item.count < 1) {
      item.count = 1;
      MyToast.show('商品数量已达到最小了哟');
      return;
    }
    item.goodIsChecked = true;
    notifyListeners();

    Future.microtask(() {
      changeBrandState(); // 改变父BrandItem的状态
      changeBottomState(); // 改变底部bottom的状态
    });
  }

  void changeEditMode() {
    this.isEditMode = !this.isEditMode;
    notifyListeners();
  }

  void deteleGood() {
    this._brandList.forEach((brandItem) {
      brandItem.isBrandChecked = false;
      for (var i = brandItem.brandList.length - 1; i >= 0; i--) {
        if (brandItem.brandList[i].goodIsChecked) {
          brandItem.brandList.removeAt(i);
        }
      }
    });
    for (var i = this._brandList.length - 1; i >= 0; i--) {
      if (this._brandList[i].brandList.length == 0) {
        this._brandList.removeAt(i);
      }
    }
    Future.microtask(() {
      changeBottomState(); // 改变底部bottom的状态
    });
  }
}

/// 品牌Model
class BrandItem {
  String brandName;
  String brandCompany;
  bool brandSendByself;
  bool brandSendBySend;
  bool isBrandChecked = false;
  List<GoodItem> brandList;
  BrandItem({
    required this.brandName,
    required this.brandCompany,
    required this.brandSendByself,
    required this.brandSendBySend,
    required this.brandList,
    required this.isBrandChecked,
  });

  /// 计算每组品牌的总价格
  int getTotalMoney() {
    int total = 0;
    for (GoodItem item in this.brandList) {
      total += item.getTotalMoney();
    }
    return total;
  }

  /*
   * 判断品牌下面的子商品是否选中，
   * 如果选中则该品牌的 @isBrandChecked 参数应为true
   * */
  bool get isSomeOneGoodSelected {
    bool isSomeOneGoodSelected = false;
    for (GoodItem item in this.brandList) {
      if (item.goodIsChecked) {
        isSomeOneGoodSelected = true;
        break;
      }
    }
    return isSomeOneGoodSelected;
  }
}

///  商品Model
class GoodItem {
  Good good;
  bool goodIsChecked = false;
  int count = 1; // 商品的个数
  GoodItem({required this.good, required this.goodIsChecked, required this.count});

  /// 计算当前单项商品的总价格
  int getTotalMoney() {
    return count * this.good.price;
  }

  /// 判断数量是否超出库存
  bool get isBiggerQuantity {
    return this.count < this.good.stockQuantity;
  }
}

/// 每个商品的详情
class Good {
  const Good({
    /** 商品品牌id */
    required this.goodsBrandId,
    /** 商品品牌类型 */
    required this.goodsBrandName,
    /** 商品品牌类型描述 */
    required this.goodsBrandCompany,
    /** 商品id */
    required this.goodsId,
    /** 商品名称 */
    required this.goodsName,
    /** 商品描述 */
    required this.goodsDescription,
    /** 图片地址 */
    required this.imageUrl,
    /** 最小购买量 */
    required this.minBuyCount,
    /** 库存数量 */
    required this.stockQuantity,
    /** 价格 */
    required this.price,
  });

  final String goodsBrandId;
  final String goodsBrandName;
  final String goodsBrandCompany;
  final String goodsId;
  final String goodsName;
  final String goodsDescription;
  final String imageUrl;
  final String minBuyCount;
  final int stockQuantity;
  final int price;
}

/// 造数据
Good getOneGood1() {
  return Good(
    goodsBrandId: 'goodsBrandId1',
    goodsBrandName: '优衣库',
    goodsBrandCompany: '北京宗申商贸有限公司',
    goodsId: 'goodsId1',
    goodsName: '男装 弹力毛料修身茄克(西装) 419434',
    goodsDescription: '1033卡其色--春秋款 XL码（适合120-140斤）',
    imageUrl: 'https://yanxuan.nosdn.127.net/1f44908a54d0a855d376d599372738d4.png',
    minBuyCount: '1',
    stockQuantity: 23,
    price: 2684,
  );
}

/// 造数据
Good getOneGood2() {
  return Good(
    goodsBrandId: 'goodsBrandId2',
    goodsBrandName: 'ZARA',
    goodsBrandCompany: '重庆宗申商贸有限公司',
    goodsId: 'goodsId2',
    goodsName: '全自动户外帐篷防雨户外双人双层免搭建3-4人帐篷套装',
    goodsDescription: '探险者（TAN XIAN ZHE）墨绿两用送价值200元礼包',
    imageUrl: 'https://yanxuan.nosdn.127.net/a15c33fdefe11388b6f4ed5280919fdd.png',
    minBuyCount: '1',
    stockQuantity: 555,
    price: 2311,
  );
}
