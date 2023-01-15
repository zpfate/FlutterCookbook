

import 'package:flutter/cupertino.dart';

void main() {

  String name =  "Jack";
  int age = 20;
  double money = 10.2;
  debugPrint("$name is $age, has \$$money");

  /// 类型推断
  var cat = "Cat";
  var result = true;
  debugPrint("this is a uppercased string: ${cat.toUpperCase()}");

  if (result) {

  }
}

class Person {

}