import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';

/// appbar 返回按钮类型
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// 自定义 AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar(
      {Key? key,
      Widget? title,
      AppBarBackType? leadingType,
      WillPopCallback? onWillPop,
      Widget? leading,
      Brightness? brightness,
      Color? backgroundColor,
      List<Widget>? actions,
      bool centerTitle = true,
      double? elevation})
      : super(
          key: key,
          title: title,
          centerTitle: centerTitle,
          brightness: brightness ?? Brightness.light,
          backgroundColor: backgroundColor ?? Color(0xfffefefe),
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? Container()
                  : AppBarBack(
                      leadingType ?? AppBarBackType.Back,
                      onWillPop: onWillPop,
                    )),
          actions: actions,
          elevation: elevation ?? 0.5,
        );
  @override
  get preferredSize => Size.fromHeight(44);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;
  final Color? color;
  final WillPopCallback? onWillPop;

  AppBarBack(this._backType, {this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop!();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Container(
              child: Icon(Icons.close, color: color ?? Color(0xFF222222), size: 24.0),
            )
          : Container(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset(
                'assets/images/nav/nav_back.png',
                color: color,
              ),
            ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;
  final Color? color;

  MyTitle(this._title, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: TextStyle(color: color ?? AppColors.primaryText, fontSize: 16, fontWeight: FontWeight.w500));
  }
}
