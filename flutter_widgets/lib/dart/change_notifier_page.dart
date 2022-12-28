import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class Counter extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}

class ChangeNotifierDemoPage extends StatefulWidget {
  const ChangeNotifierDemoPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierDemoPage> createState() => _ChangeNotifierDemoPageState();
}

class _ChangeNotifierDemoPageState extends State<ChangeNotifierDemoPage> {
  final Counter _counter = Counter();
  @override
  void initState() {
    _counter.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "ChangeNotifier"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Current count is",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "${_counter.count}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counter.dispose();
    super.dispose();
  }
}
