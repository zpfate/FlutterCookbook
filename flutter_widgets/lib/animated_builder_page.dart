import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    final CurvedAnimation curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    _animation = Tween(begin: 10.0, end: 200.0).animate(curvedAnimation);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "AnimatedBuilder"),
      body: Center(
        child: AnimatedBuilder(
          child: const FlutterLogo(),
            animation: _animation,
            builder: (ctx, child) {
              return SizedBox(
                width: _animation.value,
                height: _animation.value,
                child: child,
              );
            },
        ),
      ),
    );
  }
}
