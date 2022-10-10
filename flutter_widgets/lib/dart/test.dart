import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/log_util.dart';

class Demo {
  void test() {
    final p = Person(name: "张三", age: 12);

    /// 级联符号
    p
      ..changeName("李四")
      ..sleep();

    /// 拼接集合
    List list = [1, 2, 3, 4, 5];
    List bigList = [6, 7, 8, 9, ...list];
  }
}

class Person {
  String? name;
  int? age;
  Person({this.name, this.age});

  changeName(String newName) {
    name = newName;
  }

  sleep() {
    logUtil("sleep");
  }
}

extension EXPerson on Person {
  void printPerson() {
    debugPrint("name = $name, age = $age");
  }

  Person fullPerson() {
    return Person(name: "full", age: 100);
  }
}
