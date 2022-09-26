import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/counter.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:provider/provider.dart';

class ChangeNotifierPage extends StatelessWidget {
  ChangeNotifierPage({Key? key}) : super(key: key);
  final Counter _counter = Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "ChangeNotifierProvider"),
      body: ChangeNotifierProvider.value(
        value: _counter,
        child: const ConsumerWidget(),
      ),
    );
  }
}

class ConsumerWidget extends StatelessWidget {
  const ConsumerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(builder: (ctx, model, child) {
      return Text("${model.counter}");
    });
  }
}
