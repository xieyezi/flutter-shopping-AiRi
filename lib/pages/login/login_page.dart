import 'package:flutter/material.dart';
import 'package:AiRi/components/base_scaffold.dart';
import 'package:AiRi/components/my_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BaseScaffold(
        appBar: MyAppBar(
          leadingType: AppBarBackType.Close,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(width: 60, height: 30, color: Colors.orange),
                Text('物必达新零售'),
                Container(
                    child: Column(
                  children: <Widget>[TextField(), TextField()],
                )),
                FlatButton(onPressed: () {}, child: Text('登录'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
