import 'package:AiRi/components/components.dart';
import 'package:flutter/material.dart';
import 'package:AiRi/model/category.dart';
import 'package:AiRi/pages/search/search_page.dart';
import 'package:AiRi/utils/my_navigator.dart';

class SubCategoryList extends StatefulWidget {
  final double height;
  final CategoryDatum? data;
  final void Function(String) goPage;
  SubCategoryList({Key? key, required this.height, required this.goPage, this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SubCategoryListState();
}

class SubCategoryListState extends State<SubCategoryList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: this.dragend,
      child: Container(
        height: widget.height,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 13, bottom: 40),
            controller: controller,
            //  physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: widget.data != null
                  ? SecondryCategory(data: widget.data ?? CategoryDatum(name: '', banner: '', list: []))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              constraints: BoxConstraints(minHeight: widget.height + 5),
            )),
      ),
    );
  }

  dragend(e) {
    double offset = controller.offset;
    double maxExtentLenght = controller.position.maxScrollExtent;
    if (offset < -50) {
      widget.goPage('pre');
    }
    if (offset - maxExtentLenght > 50) {
      widget.goPage('next');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SecondryCategory extends StatelessWidget {
  final CategoryDatum data;
  SecondryCategory({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ListElement> items = data.list;

    final _deviceWidth = MediaQuery.of(context).size.width;
    final _crossAxisCount = (_deviceWidth - 100) ~/ 80;
    final _childAspectRatio = (_deviceWidth - 100) / _crossAxisCount / 100;

    return Column(
      children: <Widget>[
        Container(
          height: 92,
          margin: EdgeInsets.only(left: 15, right: 15),
          child: MyCachedNetworkImage(
            imageurl: data.banner,
          ),
        ),
        GridView.count(
          childAspectRatio: _childAspectRatio,
          crossAxisCount: _crossAxisCount,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: items.map((i) {
            return GestureDetector(
              onTap: () => MyNavigator.push(SearchPage(title: i.name, keyword: i.name)),
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 7),
                        height: 50,
                        width: 50,
                        child: MyCachedNetworkImage(
                          imageurl: i.icon,
                        ),
                      ),
                      Text(
                        i.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
            );
          }).toList(),
        ),
      ],
    );
  }
}
