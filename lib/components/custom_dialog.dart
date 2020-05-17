import 'package:flutter/material.dart';

///自定义Dialog
class CustomDialog extends StatefulWidget {
  //------------------不带图片的dialog------------------------
  final String title; //弹窗标题
  final TextStyle titleStyle; // 标题样式
  final Widget content; //弹窗内容
  final String confirmContent; //按钮文本
  final String cancelContent; //取消按钮文本
  final Color confirmTextColor; //确定按钮文本颜色
  final bool isCancel; //是否有取消按钮，默认为false true：有 false：没有
  final Color confirmColor; //确定按钮颜色
  final Color cancelColor; //取消按钮颜色
  final Color cancelTextColor; //取消按钮文本颜色
  final bool outsideDismiss; //点击弹窗外部，关闭弹窗，默认为true true：可以关闭 false：不可以关闭
  final Function confirmCallback; //点击确定按钮回调
  final Function dismissCallback; //弹窗关闭回调

  //------------------带图片的dialog------------------------
  final String image; //dialog添加图片
  final String imageHintText; //图片下方的文本提示

  const CustomDialog({
    Key key,
    this.title,
    this.content,
    this.confirmContent,
    this.confirmTextColor,
    this.isCancel = true,
    this.confirmColor,
    this.cancelColor,
    this.outsideDismiss = false,
    this.confirmCallback,
    this.dismissCallback,
    this.image,
    this.imageHintText,
    this.titleStyle,
    this.cancelContent,
    this.cancelTextColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomDialogState();
  }
}

class _CustomDialogState extends State<CustomDialog> {
  _confirmDialog() {
    /// 根据返回的索引做判断
    Navigator.of(context).pop(1);
    Future.delayed(Duration(milliseconds: 250), () {
      if (widget.confirmCallback != null) {
        widget.confirmCallback();
      }
    });
  }

  _dismissDialog() {
    /// 根据返回的索引做判断
    Navigator.of(context).pop(0);
    Future.delayed(Duration(milliseconds: 250), () {
      if (widget.dismissCallback != null) {
        widget.dismissCallback();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _columnText = Column(
      children: <Widget>[
        SizedBox(height: widget.title == null ? 0 : 15.0),
        // 头部title
        Container(
          height: 60,
          child: Text(
            widget.title == null ? '' : widget.title,
            style: widget.titleStyle,
          ),
        ),
        // 中间内容
        Container(
          height: 100,
          child: Center(
            child: widget.content,
          ),
        ),
        SizedBox(height: 0.5, child: Container(color: Color(0xDBDBDBDB))),
        // 底部按钮
        Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: widget.isCancel
                    ? Container(
                        height: 55,
                        decoration: BoxDecoration(
                            color: widget.cancelColor == null
                                ? Color(0xFFFFFFFF)
                                : widget.cancelColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0))),
                        child: FlatButton(
                          child: Text(
                              widget.cancelContent == null
                                  ? '取消'
                                  : widget.cancelContent,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: widget.cancelColor == null
                                    ? (widget.cancelTextColor == null
                                        ? Colors.black87
                                        : widget.cancelTextColor)
                                    : Color(0xFFFFFFFF),
                              )),
                          onPressed: _dismissDialog,
                          splashColor: widget.cancelColor == null
                              ? Color(0xFFFFFFFF)
                              : widget.cancelColor,
                          highlightColor: widget.cancelColor == null
                              ? Color(0xFFFFFFFF)
                              : widget.cancelColor,
                        ),
                      )
                    : Text(''),
                flex: widget.isCancel ? 1 : 0,
              ),
              SizedBox(
                  width: widget.isCancel ? 1.0 : 0,
                  child: Container(color: Color(0xDBDBDBDB))),
              Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: widget.confirmColor == null
                          ? Color(0xFFFFFFFF)
                          : widget.confirmColor,
                      borderRadius: widget.isCancel
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(16.0))
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)),
                    ),
                    child: FlatButton(
                      onPressed: _confirmDialog,
                      child: Text(
                          widget.confirmContent == null
                              ? '确定'
                              : widget.confirmContent,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: widget.confirmColor == null
                                ? (widget.confirmTextColor == null
                                    ? Colors.black87
                                    : widget.confirmTextColor)
                                : Color(0xFFFFFFFF),
                          )),
                      splashColor: widget.confirmColor == null
                          ? Color(0xFFFFFFFF)
                          : widget.confirmColor,
                      highlightColor: widget.confirmColor == null
                          ? Color(0xFFFFFFFF)
                          : widget.confirmColor,
                    ),
                  ),
                  flex: 1),
            ],
          ),
        )
      ],
    );

    Column _columnImage = Column(
      children: <Widget>[
        SizedBox(
          height: widget.imageHintText == null ? 35.0 : 23.0,
        ),
        Image(
            image: AssetImage(widget.image == null ? '' : widget.image),
            width: 72.0,
            height: 72.0),
        SizedBox(height: 10.0),
        Text(widget.imageHintText == null ? "" : widget.imageHintText,
            style: TextStyle(fontSize: 16.0)),
      ],
    );

    /// 路由拦截
    return WillPopScope(
        child: GestureDetector(
          onTap: () => {widget.outsideDismiss ? _dismissDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                width: widget.image == null ? width - 100.0 : width - 150.0,
                height: 231.0,
                alignment: Alignment.center,
                child: widget.image == null ? _columnText : _columnImage,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return widget.outsideDismiss;
        });
  }
}
