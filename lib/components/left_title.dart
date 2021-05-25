import 'package:flutter/material.dart';
import 'package:AiRi/styles/colors.dart';

class LeftTitle extends StatelessWidget {
  final Color? tipColor;
  final String title;
  const LeftTitle({Key? key, this.tipColor, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      child: Row(
        children: <Widget>[
          Container(
            color: tipColor ?? AppColors.primaryColor,
            margin: EdgeInsets.only(right: 15),
            width: 3,
            height: 14,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
