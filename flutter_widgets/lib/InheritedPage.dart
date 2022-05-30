
import 'package:flutter/material.dart';
import 'package:flutter_widgets/log_util.dart';

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
    return CountContainer(count: _count, increment: _incrementCounter, child: const Counter());
  }
}

class CountContainer extends InheritedWidget {

  // 方便其子Widget在Widget树中找到它
  static CountContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CountContainer>();
  }

  final int count;
  final Function() increment;
  const CountContainer({Key? key, required this.count,
  required this.increment,
    required Widget child}): super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) {
    // TODO: implement updateShouldNotify
    return count != oldWidget.count;
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取InheritedWidget的根节点
    CountContainer? state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("InheritedWidget demo"),),
      body: Text('You have pushed the button this many times: ${state?.count}'),
      floatingActionButton: FloatingActionButton(onPressed: state?.increment),
    );
  }
}
