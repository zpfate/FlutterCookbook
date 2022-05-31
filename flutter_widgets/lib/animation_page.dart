
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 创建动画周期为1秒的AnimationController对象
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    /// 创建一条震荡曲线
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    /// Tween默认线性动画
    // _animation = Tween(begin: 50.0, end: 200.0).animate(_animationController)..addListener(() {
    //   setState(() {});
    // });
    _animation = Tween(begin: 10.0, end: 200.0).animate(curvedAnimation)..addListener(() {
      setState(() {
      });
    });

    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse();//动画结束时反向执行
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();//动画反向执行完毕时，重新执行
    //   }
    // });

    _animationController.repeat(reverse: true);

    /// 让动画重复执行
    // _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Animation"),
      body: Center(
        child: SizedBox(
          width: _animation.value,
          height: _animation.value,
          child: const FlutterLogo(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
