import 'package:flutter/material.dart';

import 'key_box.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyBox(
              // key: ValueKey(1),
              color: Colors.green,
            ),
            KeyBox(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
