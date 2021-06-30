import 'package:AiRi/components/components.dart';
import 'package:get/get.dart';

import 'shopping_cart_model.dart';

class ShoppingCartController extends GetxController {
  /// 是否选中全部商品
  bool _isSelectAllGood = false;

  /// 选中的商品数量
  int _goodTotalNum = 0;

  /// 选中的商品的总价格
  int _goodTotalPrice = 0;

  /// 是否为编辑模式
  bool isEditMode = false;

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

  @override
  void onInit() {
    changeBrandState();
    changeBottomState();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

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
    update();
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
    update();

    Future.microtask(() {
      changeBrandState(); // 改变父BrandItem的状态
      changeBottomState(); // 改变底部bottom的状态
    });
  }

  void changeEditMode() {
    this.isEditMode = !this.isEditMode;
    update();
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
