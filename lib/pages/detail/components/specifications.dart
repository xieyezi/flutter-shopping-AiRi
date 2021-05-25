import 'package:AiRi/components/bottom_button.dart';
import 'package:AiRi/components/components.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/model/detail.dart';
import 'package:AiRi/styles/colors.dart';

class Specifications extends StatelessWidget {
  final String goodsImgUrl;
  final String guidePrice;
  final String price;
  final String miniBuyNum;
  final List<SpecificationList> specificationList;

  const Specifications(
      {Key? key,
      required this.guidePrice,
      required this.miniBuyNum,
      required this.specificationList,
      required this.goodsImgUrl,
      required this.price})
      : super(key: key);

  /////////////// 对话框UI
  /// 对话框上边部分
  Widget _buildDialogTop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
      // color: Colors.red,
      height: 120,
      child: Stack(
        children: <Widget>[
          //右上角button
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Color(0xFF000000),
                size: 24.0,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CachedNetworkImage(
              imageUrl: goodsImgUrl,
              height: 120,
              width: 120,
            ),
          ),
          Positioned(
            top: 17,
            left: 135,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 7),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '优惠价',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            top: 42,
            left: 135,
            child: RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$price',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
            ),
          ),
          Positioned(
            top: 83.5,
            left: 135,
            child: Text(
              '数量',
              style: TextStyle(
                color: AppColors.primaryGreyText,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: 83.5,
            right: 85,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/detail/dowm.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          Positioned(
            top: 78.5,
            right: 35,
            child: Container(
              width: 40,
              height: 30,
              color: Color(0xFFF3F3F3),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 83.5,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'assets/images/detail/up.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 对话框下边部分
  Widget _buildDialogBottom(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
      child: Column(
        children: specificationList.map((item) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      color: AppColors.primaryGreyText,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  child: Wrap(
                    spacing: 15.0, // 主轴(水平)方向间距
                    runSpacing: 15.0,
                    alignment: WrapAlignment.start, //沿主轴方向居中
                    children: item.specification.map<Widget>((item) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Color(0xFF4A4A4A),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// 对话框
  Widget _buildDialog(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.75 -
                60 -
                MediaQuery.of(context).padding.bottom,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  /// 对话框上边部分
                  _buildDialogTop(context),

                  /// 对话框下边部分
                  _buildDialogBottom(context),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomButton(
              text: '确定',
              handleOk: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  ///// 规格UI
  /// 第一行
  Widget _buildUp(TextStyle geryText) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('指导零售价', style: geryText),
          Text('￥$guidePrice', style: geryText),
        ],
      ),
    );
  }

  /// 第二行
  Widget _buildMiddle(TextStyle geryText) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('最低购买数量', style: geryText),
          Text('$miniBuyNum件', style: geryText),
        ],
      ),
    );
  }

  /// 规格选择
  Widget _buildBottom(BuildContext context, TextStyle geryText,
      TextStyle specificationTextStyle) {
    return Container(
      height: 40,
      child: GestureDetector(
        onTap: () => openDialog(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('已选', style: geryText),
            Row(
              children: <Widget>[
                Container(
                  child: Text('请选择规格 数量', style: specificationTextStyle),
                ),
                Container(
                  width: 20,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF000000),
                    size: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 打开对话框选择规格
  void openDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        builder: (BuildContext context) {
          return _buildDialog(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    /// 灰色字体
    TextStyle geryText = TextStyle(
      color: Color(0xFF9B9B9B),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    // 选择规格字体
    TextStyle specificationTextStyle = TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Container(
      height: 121,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          _buildUp(geryText),
          MyDivider(),
          _buildMiddle(geryText),
          _buildBottom(context, geryText, specificationTextStyle),
        ],
      ),
    );
  }
}
