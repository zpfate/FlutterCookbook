import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

import 'key_box.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {

  /// Local Key: Value Key  Object Key Unique Key
  /// Global Key
  /// Local Key指的是在当前Widget层级下，有唯一的Key属性，
  /// 而Global Key，则是在全局APP中，具有唯一性。
  /// Global Key的性能会比Local Key差很多。
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


