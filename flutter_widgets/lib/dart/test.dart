import 'package:flutter/material.dart';

class Person {
  String? name;
  int? age;
  Person({this.name, this.age});
}

extension EXPerson on Person {
  void printPerson() {
    debugPrint("name = $name, age = $age");
  }

  Person fullPerson() {
    return Person(name: "full", age: 100);
  }
}
