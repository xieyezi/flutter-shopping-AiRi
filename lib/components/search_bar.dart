import 'package:flutter/material.dart';
import 'package:AiRi/styles/colors.dart';

class SearchBar extends StatefulWidget {
  final String keyword;
  final Function myOntap;
  const SearchBar({Key? key, required this.myOntap, this.keyword = ''}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // 从其他页面传入的搜索关键词，将当前输入框的值绑定为传入的值
    _textEditController.text = widget.keyword;
    // 控制输入框光标位置为最后一个字
    _textEditController.selection = TextSelection.fromPosition(
      TextPosition(
          affinity: TextAffinity.downstream, offset: widget.keyword.length),
    );
    return Container(
      color: Colors.white,
      height: 49,
      padding: EdgeInsets.only(top: 7, right: 15, bottom: 7, left: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F7F7),
                borderRadius: BorderRadius.circular(49 * 0.5),
              ),
              child: Container(
                child: TextField(
                  controller: _textEditController,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/images/home/sousuo.png',
                      width: 15,
                      height: 15,
                    ),
                    isDense: true,
                    hintText: "最高可降8000",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            /// 将输入值回调传至点击函数
            onTap: () => widget.myOntap(_textEditController.text),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Color(0xFF17191A),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
