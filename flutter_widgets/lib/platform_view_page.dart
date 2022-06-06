import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class PlatformViewPage extends StatelessWidget {
  const PlatformViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Platform View"),
      body: Container(
        // child,
      ),
    );
  }
}
