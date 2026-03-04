

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationPage extends StatefulWidget {
  const OrientationPage({super.key});

  @override
  State<OrientationPage> createState() => _OrientationPageState();
}

class _OrientationPageState extends State<OrientationPage> {

  @override
  void initState() {
    super.initState();
    // 设置页面初始为横屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (ctx, orientation) {
      debugPrint("当前屏幕方向: $orientation");
      return const Center(child: Text("data"));
    });
  }
}
