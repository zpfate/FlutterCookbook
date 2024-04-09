

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({super.key});

  @override
  State<TweenAnimationBuilderPage> createState() => _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "TweenAnimationBuilder"),
      body:  TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Opacity(
              opacity: value as double,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red[200],
              ),
            );
          }),
    );
  }
}
