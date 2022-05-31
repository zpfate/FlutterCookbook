import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> with TickerProviderStateMixin {

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
      appBar: defaultAppBar(title: "Animated Widget"),
      body: AnimatedLogo(listenable: _animation,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {

  const AnimatedLogo({Key? key, required Animation<double> listenable}) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: SizedBox(
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
