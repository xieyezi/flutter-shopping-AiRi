import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCustomFooter extends StatelessWidget {
  const MyCustomFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme:
              TextTheme(display1: TextStyle(color: Colors.grey, fontSize: 12))),
      child: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败", style: Theme.of(context).textTheme.display1);
          } else if (mode == LoadStatus.canLoading) {
            body =
                Text("松手,加载更多!", style: Theme.of(context).textTheme.display1);
          } else {
            body = Text("我是有底线的~", style: Theme.of(context).textTheme.display1);
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
    );
  }
}
