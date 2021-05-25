import 'package:flutter/material.dart';

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
    // 从其他页面传入的搜索关键词，默认为''
    _textEditController.text = widget.keyword;
    return Container(
      height: 49,
      padding: EdgeInsets.only(top: 7, right: 15, bottom: 7, left: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7F7),
                  borderRadius: BorderRadius.circular(49 * 0.5),
                ),
                child: Container(
                  child: TextField(
                    controller: _textEditController,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'assets/images/home/sousuo.png',
                        width: 15,
                        height: 15,
                      ),
                      isDense: true,
                      hintText: "最高可降8000",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
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
                  color: Colors.white,
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
