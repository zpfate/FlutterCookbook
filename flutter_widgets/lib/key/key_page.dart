import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

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
      appBar: defaultAppBar(title: "Key Demo"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KeyBox(color: Colors.green),
            KeyBox( color: Colors.yellow,),

          ],
        ),
      ),
    );
  }
}


