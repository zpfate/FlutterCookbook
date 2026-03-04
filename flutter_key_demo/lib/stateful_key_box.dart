import 'package:flutter/material.dart';

class StatefulKeyBox extends StatefulWidget {
  final Color color;
  const StatefulKeyBox({Key? key, required this.color}) : super(key: key);

  @override
  _StatefulKeyBoxState createState() => _StatefulKeyBoxState();
}

class _StatefulKeyBoxState extends State<StatefulKeyBox> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    // StatefulElement

    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: Center(
        child: TextButton(
          onPressed: () {
            setState(() => counter++);
          },
          child: Text(
            counter.toString(),
            style: const TextStyle(fontSize: 60),
          ),
        ),
      ),
    );
  }
}
