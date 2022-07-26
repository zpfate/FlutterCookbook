import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';

 pushAssociateTextField(context, {double topMargin = 0.0}) {
  Navigator.of(context).push(_PopRoute(child: AssociateTextFieldWidget(topMargin: topMargin,)));
}

class _PopRoute extends PopupRoute {

  final Duration _duration = const Duration(milliseconds: 300);

  final Widget child;

  _PopRoute({required this.child});

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.transparent;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return child;
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => _duration;
}

class AssociateTextFieldWidget extends StatelessWidget {
   final double topMargin;
  const AssociateTextFieldWidget({Key? key, required this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for(int i = 0; i< 10; i++) {
      children.add(
          GestureDetector(
            child: ListTile(title: Text("标题$i"),),
            onTap: () {
              /// 点击方法

            },
          )
      );
    }

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          /// 点击返回
          Navigator.of(context).pop();
        },
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: topMargin),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownTextField extends StatelessWidget {

   final TextEditingController controller;
   final List<String> list;
   const DropDownTextField({Key? key, required this.list, required this.controller}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return TextField(
       controller: controller,
       onChanged: (text) {
         _handleTextChanged(context);
       },
     );
   }


   void _handleTextChanged(context) {
     final NavigatorState navigator = Navigator.of(context);
     final RenderBox itemBox = context.findRenderObject()! as RenderBox;
     final Rect itemRect = itemBox.localToGlobal(Offset.zero, ancestor: navigator.context.findRenderObject()) & itemBox.size;
     logUtil(message: "$itemRect");

     pushAssociateTextField(context, topMargin: itemRect.bottom);
   }
}

class PopupRoutePage extends StatelessWidget {
  const PopupRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: defaultAppBar(title: "PopupRoute"),
      body: Center(
        child: DropDownTextField(list: [], controller: _controller),
      ),
      // body: ,
    );
  }
}
