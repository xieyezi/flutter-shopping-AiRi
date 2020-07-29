import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/pages/login/login_page.dart';
import 'package:AiRi/utils/my_navigator.dart';

class ManagePage extends StatefulWidget {
  ManagePage({Key key}) : super(key: key);

  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "管理",
      leadType: AppBarBackType.None,
      actions: <Widget>[AppBarShopCartIconButton()],
      body: GestureDetector(
        onTap: () {
          MyNavigator.present(LoginPage());
        },
        child: Center(child: Text('敬请期待...')),
      ),
    );
  }
}
