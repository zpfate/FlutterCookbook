import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/counter.dart';
import 'package:provider/provider.dart';

class ChangeNotifierWidget extends StatelessWidget {

  ChangeNotifierWidget({Key? key}) : super(key: key);

  final Counter _counter = Counter();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _counter,
    );
  }
}
