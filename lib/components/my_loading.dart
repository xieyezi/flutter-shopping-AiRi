import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';

class MyLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: AppColors.primaryColor,
    ));
  }
}
