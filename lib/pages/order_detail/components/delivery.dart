import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

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
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '物流信息',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          _buildItem(
            tip: '物流编号： ',
            content: '20200401021516851384',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
          _buildItem(
            tip: '发货时间： ',
            content: '2020-04-01 12:30:12',
            infoTextTip: infoTextTip,
            infoText: infoText,
          ),
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
