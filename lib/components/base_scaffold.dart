import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/components/my_app_bar.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold(
      {String? title,
      PreferredSizeWidget? appBar,
      Widget? body,
      List<Widget>? actions,
      AppBarBackType leadType = AppBarBackType.Back,
      WillPopCallback? onWillPop,
      Brightness brightness = Brightness.light,
      Widget? floatingActionButton,
      Color appBarBackgroundColor = Colors.white,
      Color? titleColor,
      bool centerTitle = true,
      FloatingActionButtonLocation? floatingActionButtonLocation})
      : super(
          appBar: appBar ??
              MyAppBar(
                brightness: Brightness.light,
                leadingType: leadType,
                onWillPop: onWillPop,
                actions: actions ?? [],
                centerTitle: centerTitle,
                title: MyTitle(title ?? '', color: titleColor ?? Colors.grey[800]),
                backgroundColor: appBarBackgroundColor,
              ),
          backgroundColor: Colors.white,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}
