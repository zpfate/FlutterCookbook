import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Hero"),
      body: GestureDetector(
        onTap: () {
          push(context, const HeroNextPage());
        },
        child: const Hero(
          tag: "hero",
          child: SizedBox(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class HeroNextPage extends StatelessWidget {
  const HeroNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "HeroNextPage"),
      body: const Hero(
        tag: 'hero',
        child: SizedBox(
          width: 300,
          height: 300,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
