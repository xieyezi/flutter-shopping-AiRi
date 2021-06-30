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
