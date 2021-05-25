import 'package:AiRi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class CategoryMenue extends StatefulWidget {
  final List<String> items;
  final double itemHeight;
  final double itemWidth;
  final ValueChanged<int> menueTaped;
  CategoryMenue(
      {Key? key, required this.items, required this.itemHeight, required this.itemWidth, required this.menueTaped})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryMenueState();
}

class CategoryMenueState extends State<CategoryMenue> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  int currentItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    int len = widget.items.length;
    List<Widget> widgets = List.generate(len, (i) {
      return InkWell(
        onTap: () => _menueTaped(i),
        child: Container(
          height: widget.itemHeight,
          alignment: Alignment.center,
          child: currentItemIndex == i
              ? Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //背景径向渐变
                      colors: [AppColors.buttonLine1, AppColors.buttonLine2],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.items[i],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  child: Text(
                    widget.items[i],
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                ),
        ),
      );
    });

    return Column(children: widgets);
  }

  _menueTaped(int i) {
    widget.menueTaped(i);
    moveToTap(i);
  }

  moveToTap(int i) {
    double begin = currentItemIndex * widget.itemHeight;
    double end = i * widget.itemHeight;
    // print('begin' + begin.toString() + "-----" + end.toString());
    animation = Tween(begin: begin, end: end).animate(new CurvedAnimation(parent: controller, curve: Curves.linear));
    controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        //  print(currentItemIndex);
        currentItemIndex = i;
      }
    });

    controller.forward(from: 0);
  }

  initState() {
    controller = AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
