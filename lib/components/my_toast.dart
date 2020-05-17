import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MyToast {
  static show(String msg, {int duration = 1500}) {
    showToast(msg,
        duration: Duration(milliseconds: duration),
        textPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        radius: 6);
  }
}
