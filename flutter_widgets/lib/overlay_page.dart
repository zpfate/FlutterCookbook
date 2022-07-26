import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class OverlayPage extends StatelessWidget {
  const OverlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "OverLayer"),
    );
  }
}
