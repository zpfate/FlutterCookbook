import 'package:flutter/material.dart';

class KeyBox extends StatefulWidget {

  final Color color;
  const KeyBox({Key? key,required this.color}) : super(key: key);

  @override
  _KeyBoxState createState() => _KeyBoxState();
}

class _KeyBoxState extends State<KeyBox> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
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
