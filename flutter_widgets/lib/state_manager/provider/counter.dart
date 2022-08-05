import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {

  int _count = 0;
  /// 读方法
  int get counter => _count;
  /// 写方法
  void increment() {
    _count++;
    notifyListeners();
  }
}