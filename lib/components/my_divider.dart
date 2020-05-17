import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xffdfdfdf),
      height: 0.5,
      indent: 20,
      endIndent:20
    );
  }
}

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Color(0xffdfdfdf),
      width: 1,
    );
  }
}
