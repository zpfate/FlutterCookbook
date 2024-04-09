
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';


class AnimationExamplePage extends StatefulWidget {
  const AnimationExamplePage({super.key});

  @override
  State<AnimationExamplePage> createState() => _AnimationExamplePageState();
}

class _AnimationExamplePageState extends State<AnimationExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Animation Example"),
    );
  }
}
