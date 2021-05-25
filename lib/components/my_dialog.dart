import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/my_navigator.dart';

class MyDialog {
  MyDialog._();

  static OverlayEntry? _entry;

  static showLoading(String msg, {BuildContext? context, bool barrier = false}) {
    hideLoading();

    _entry = OverlayEntry(builder: (BuildContext context) {
      return barrier
          ? Container(
              color: Color(0x66000000),
              child: _loadingContainer(msg),
            )
          : _loadingContainer(msg);
    });

    Overlay.of(context ?? MyNavigator.ctx)?.insert(_entry!);
  }

  static Center _loadingContainer(String msg) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(bottom: 30),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 14, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color(0xbb000000),
                      borderRadius: (BorderRadius.circular(4)),
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          msg,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color(0xfff1f1f1),
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  static hideLoading() {
    _entry?.remove();
    _entry = null;
  }
}
