
import 'package:flutter/foundation.dart';

class Person {
  /// Null Safe
  int id;
  String name;
  int? age;
  String? sex;
  /// 构造函数-可选命名参数{}
  Person(this.id,{required this.name, this.age, this.sex = '男'});

  printInfo() {
    debugPrint("编号:$id, 姓名:$name, 年龄: ${age ?? "无"}, 性别:$sex");
  }

  sleep() {
    debugPrint('sleep');
  }

  /// 可选参数[]
  studyTween(DateTime startTime, [DateTime? endTime]) {
    debugPrint("stduy ---");
  }
}


void main() {

  final p = Person(1, name: "alex", age: 12);
  /// 可选参数
  final now = DateTime.now();
  p.studyTween(now);
  p.studyTween(now, DateTime.now().add(const Duration(hours: 3)));


  /// 级联
  p..printInfo()..sleep();
  p..name = "Jack"
    ..age = 24
    ..id = 2;
  p.printInfo();

  /// ...的作用
  final List<int> values = [1, 2, 3, 4];
  List<int> array = [0, 2, ...values];
  debugPrint("array = $array");
}

