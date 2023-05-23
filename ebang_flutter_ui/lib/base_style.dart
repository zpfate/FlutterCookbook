

import 'dart:ui';

class BaseStyle {

  static regular({Color? color, double? fontSize}) {
    return TextStyle(color: color, fontSize: fontSize);
  }

  static medium({Color? color, double? fontSize}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w400);
  }

  static bold({Color? color, double? fontSize}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
  }

}