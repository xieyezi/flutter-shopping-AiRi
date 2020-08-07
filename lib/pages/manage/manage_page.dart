import 'package:AiRi/components/components.dart';
import 'package:AiRi/components/my_app_bar.dart';
import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/components/base_scaffold.dart';

class ManagePage extends StatelessWidget {
  final String supplierId;
  const ManagePage({Key key, this.supplierId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        brightness: Brightness.dark,
        leadingType: AppBarBackType.None,
        backgroundColor: AppColors.supplierColor1,
        title: null,
      ),
      body: ManageContainer(),
    );
  }
}

class ManageContainer extends StatelessWidget {
  const ManageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          _buildTop(context),
          Container(
            height: 140,
            margin: EdgeInsets.only(top: 90, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: LeftTitle(title: '我的功能'),
                )
              ],
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.only(top: 250, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              'https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 350, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: LeftTitle(title: '更多工具'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 上方
  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 140,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //背景径向渐变
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.supplierColor1, AppColors.supplierColor2],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 70,
          width: 300,
          child: Row(
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.network(
                  'https://yanxuan.nosdn.127.net/4cb504b640d917efcccf5fe6c73f6428.png',
                  height: 80,
                  width: 80,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '觉非',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Divider(height: 5),
                    Text('填写兴趣更懂你哦～', style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
