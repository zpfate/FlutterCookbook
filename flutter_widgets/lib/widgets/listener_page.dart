import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class ListenerPage extends StatelessWidget {
  const ListenerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Listener"),
      body: Center(
        child: Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(const Size(200, 200)),
            child: const Center(
              child: Text(
                'Click me',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          /// 按下回调
          onPointerDown: (event) => logUtil("onPointerDown"),

          /// 松手抬起时回调
          onPointerUp: (event) => logUtil("onPointerUp"),

          /// 移动时回调
          onPointerMove: (event) => logUtil("onPointerMove"),

          /// 按住
          onPointerHover: (event) => logUtil("onPointerHover"),

          // onPointerCancel: (event) => logUtil("onPointerCancel"),
          // onPointerSignal: (event) => logUtil("onPointerSignal"),
        ),
      ),
    );
  }
}
