import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/pages/choose_address/choose_address.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:AiRi/utils/my_navigator.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  /// 收货人
  Widget _buildContact(BuildContext context) {
    TextStyle contactText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _showEditDialog(context),
      child: Container(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('张小风', style: contactText),
            SizedBox(width: 30),
            Text('18888888888', style: contactText),
            SizedBox(width: 15),
            Image.asset(
              'assets/images/confirm_order/edit.png',
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  /// 收货地址
  Widget _buildAddress(BuildContext context) {
    TextStyle leftText = TextStyle(
      color: Color(0xFF9B9B9B),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
    TextStyle rightText = TextStyle(
      color: Color(0xFF121212),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final addr = await MyNavigator.push<int>(ChooseAddress());
        print(addr);
        // 保存至provider
      },
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 130,
              child: Text(
                '重庆  重庆市 渝北区 天宫街道万达广场店21-6号地重庆  重庆市 渝北区地址',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: leftText,
              ),
            ),
            Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('切换地址', style: rightText),
                  Container(
                    width: 20,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFF000000),
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 弹出对话框
  void _showEditDialog(BuildContext context) {
    final _nameEditController = TextEditingController();
    final _phoneEditController = TextEditingController();
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CustomDialog(
            title: '修改收货人信息',
            titleStyle: TextStyle(
              color: Color(0xFF121212),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            content: Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
                      controller: _nameEditController,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "请填写收货人姓名",
                        hintStyle: TextStyle(
                          color: Color(0xFFBEBEBE),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
                      controller: _phoneEditController,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "请填写收货人手机号码",
                        hintStyle: TextStyle(
                          color: Color(0xFFBEBEBE),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            confirmContent: '确定',
            confirmTextColor: Color(0xFF121212),
            cancelContent: '取消',
            cancelTextColor: Color(0xFF9B9B9B),
            isCancel: true,
            confirmCallback: () {
              /// 调用provider保存
              // print(_nameEditController.text);
              // print(_phoneEditController.text);
            },
            dismissCallback: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          _buildContact(context),
          Divider(color: Color(0xffdfdfdf), height: 0.5),
          _buildAddress(context),
        ],
      ),
    );
  }
}
