import 'package:flutter/material.dart';
import 'package:AiRi/styles/styles.dart';

class Remark extends StatefulWidget {
  const Remark({Key? key}) : super(key: key);

  @override
  _RemarkState createState() => _RemarkState();
}

class _RemarkState extends State<Remark> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xFFD9D9D9)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _textEditController,
              cursorColor: AppColors.primaryColor,
              maxLines: 2,
              maxLength: 200,
              style: TextStyle(
                color: Color(0xFFBEBEBE),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                isDense: true,
                labelText: "订单备注",
                labelStyle: TextStyle(
                  color: Color(0xFF121212),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                hintText: "请输入备注信息",
                hintStyle: TextStyle(
                  color: Color(0xFFBEBEBE),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
