import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/widgets/InheritedWidget/counter.dart';
import 'package:flutter_widgets/widgets/InheritedWidget/counter_inherited_widget.dart';

class InheritedPage extends StatefulWidget {
  const InheritedPage({Key? key}) : super(key: key);
  @override
  State<InheritedPage> createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "InheritedWidget Demo"),
      body: CounterInheritedWidget(
        count: _count,
        child: Center(
          child: Column(
            children: const [
              StatelessCounter(),
              StatefulCounter(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
