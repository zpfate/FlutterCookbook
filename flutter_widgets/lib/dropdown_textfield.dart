import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';


class _PopRoute extends PopupRoute {

  final Duration _duration = const Duration(milliseconds: 300);

  final Widget child;

  _PopRoute({required this.child});

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => throw UnimplementedError();

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => throw UnimplementedError();

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return child;
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => _duration;


}





class DropDownTextField extends StatelessWidget {
  const DropDownTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "DropDownTextField Demo"),

    );
  }
}
