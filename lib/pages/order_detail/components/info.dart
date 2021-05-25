import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';

class OrderDetailInfo extends StatelessWidget {
  const OrderDetailInfo({Key? key}) : super(key: key);

  void _catBankInfo(BuildContext context) {
    /// 构建每一项
    Widget _buildItem(String title, String content) {
      return Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 30,
              color: Color(0xFFF7F7F7),
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.primaryGreyText,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return SimpleDialog(
            title: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '收货信息',
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop('close'),
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF000000),
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Container(
                height: 300,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildItem(
                      '收货人',
                      '觉非',
                    ),
                    _buildItem(
                      '快递',
                      '中通快递：20200401021516851384',
                    ),
                    _buildItem(
                      '地址',
                      '重庆市巴南区花溪街道190号',
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle infoTextTip = TextStyle(
      color: Color(0xFF4A4A4A),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    TextStyle infoText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildItem(
            tip: '订单编号： ',
            content: '20200401021516851384',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          _buildItem(
            tip: '提交时间： ',
            content: '2020-04-01 12:30:12',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          _buildItem(
            tip: '支付编号： ',
            content: 'wbd543181ad6543',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          _buildItem(
            tip: '支付时间： ',
            content: '2020-04-01 12:30:12',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          _buildItem(
            tip: '支付方式： ',
            content: '全款支付',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          Container(
            height: 40,
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: '支付渠道： ',
                      style: infoTextTip,
                      children: <TextSpan>[
                        TextSpan(
                          text: '线下转账',
                          style: infoText,
                        )
                      ]),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () => _catBankInfo(context),
                  child: Container(
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Text(
                        '查看收货信息',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Color(0xFFD9D9D9), height: 1),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '合计金额 ',
                  style: infoTextTip,
                ),
                Text(
                  '￥2988',
                  style: TextStyle(
                    color: AppColors.priceColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 每一项
  Widget _buildItem(
      {required String tip, required String content, required TextStyle infoTextTip, required TextStyle infoText}) {
    return Container(
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(text: tip, style: infoTextTip, children: <TextSpan>[
            TextSpan(
              text: content,
              style: infoText,
            )
          ]),
        ),
      ),
    );
  }
}
