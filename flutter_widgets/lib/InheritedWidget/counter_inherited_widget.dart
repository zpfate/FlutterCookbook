import 'package:flutter/material.dart';

class CounterInheritedWidget extends InheritedWidget {
  /// 需要共享的数据
  final int count;

  const CounterInheritedWidget(
      {Key? key, required this.count, required Widget child})
      : super(key: key, child: child);

  /// 默认的约定:如果状态是希望暴露的 应该提供一个静态of方法来获取对象
  /// 返回实例对象 方便子树中的widget获取共享数据
  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  /// 是否通知widget树中依赖该共享数据的子widget
  /// 这里当count发生变化时, 是否通知子树中所有依赖count的Widget重新build
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return count != oldWidget.child;
  }
}
