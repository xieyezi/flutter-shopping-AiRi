import 'package:AiRi/styles/styles.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String? text;
  final Function? handleOk;
  const BottomButton({Key ?key, this.handleOk, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOk!(),
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 10,
          right: 10,
        ),
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //背景径向渐变
            colors: [AppColors.buttonLine1, AppColors.buttonLine2],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
