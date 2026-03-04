

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class GesturePainterPage extends StatefulWidget {
  const GesturePainterPage({super.key});

  @override
  State<GesturePainterPage> createState() => _GesturePainterPageState();
}

class _GesturePainterPageState extends State<GesturePainterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "GesturePainter"),
      // body: _scheduleWidget(),
    );
  }


  // Widget _buildBodyWidget() {
  //   return
  // }

}
