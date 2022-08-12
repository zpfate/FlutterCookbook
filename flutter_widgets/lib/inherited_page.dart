import 'package:flutter/material.dart';

class InheritedPage extends StatefulWidget {
  const InheritedPage({Key? key}) : super(key: key);
  @override
  State<InheritedPage> createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  int _count = 0;
  void _incrementCounter() => setState(() {
        _count++;
      });

  @override
  Widget build(BuildContext context) {
    return CountContainer(
        count: _count, increment: _incrementCounter, child: const Counter());
  }
}

class CountContainer extends InheritedWidget {
  /// 方便其子Widget在Widget树中找到它
  /// 该方法可以实现 也可以不实现
  static CountContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountContainer>();
  }

  final int count;
  final Function() increment;
  const CountContainer(
      {Key? key,
      required this.count,
      required this.increment,
      required Widget child})
      : super(key: key, child: child);

  /// 该方法用于判断InheritedWidget是否需要重建,通知下层组件更新数据时被调用
  @override
  bool updateShouldNotify(CountContainer oldWidget) {
    return count != oldWidget.count;
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 实现了of方法,获取InheritedWidget的根节点
    // CountContainer? inheritedWidget = CountContainer.of(context);

    /// 未实现静态of方法
    // ignore: unused_local_variable
    var inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<CountContainer>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget demo"),
      ),
      body: Text(
          'You have pushed the button this many times: ${inheritedWidget?.count}'),
      backgroundColor: Colors.red,
      floatingActionButton:
          FloatingActionButton(onPressed: inheritedWidget?.increment),
    );
  }
}
