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
        child: Consumer<Counter>(builder: (ctx, model, child) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Current count is"),
                Text(
                  "${model.counter}",
                  style: const TextStyle(color: Colors.red, fontSize: 25),
                )
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
