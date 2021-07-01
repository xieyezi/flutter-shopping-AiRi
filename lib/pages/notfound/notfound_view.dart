import 'package:AiRi/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由没有找到"),
      ),
      body: ListTile(
        title: Text("返回首页"),
        subtitle: Text('返回首页'),
        onTap: () => Get.offAllNamed(AppRoutes.Main),
      ),
    );
  }
}
