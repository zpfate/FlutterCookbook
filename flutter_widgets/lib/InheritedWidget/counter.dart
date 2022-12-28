import 'package:flutter/material.dart';
import 'package:flutter_widgets/InheritedWidget/counter_inherited_widget.dart';

class StatelessCounter extends StatelessWidget {
  const StatelessCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 实现了of方法,获取InheritedWidget的根节点
    CounterInheritedWidget? inheritedWidget =
        CounterInheritedWidget.of(context);

    /// 未实现静态of方法
    // var inheritedWidget =
    //     context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();

    return Container(
      width: 100,
      height: 100,
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text(
        "${CounterInheritedWidget.of(context)!.count}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class StatefulCounter extends StatefulWidget {
  const StatefulCounter({Key? key}) : super(key: key);

  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Text(
        "${CounterInheritedWidget.of(context)!.count}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
