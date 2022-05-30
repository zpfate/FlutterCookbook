import 'package:flutter/material.dart';

class TouchPage extends StatelessWidget {
  const TouchPage({Key? key}) : super(key: key);
//红色container坐标
//   double _top = 0.0;
//   double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listener'),
        ),
        body: Column(
          children: [
            Listener(
              child: Container(
                color: Colors.red, //背景色红色
                width: 300,
                height: 300,
              ),
              onPointerDown: (event) => print("down $event"), //手势按下回调
              onPointerMove: (event) => print("move $event"), //手势移动回调
              onPointerUp: (event) => print("up $event"), //手势抬起回调);,
            ),
          ],
        )
    );
  }
}


class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  //红色container坐标
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector'),),
      body: Stack(
        //使用Stack组件去叠加视图，便于直接控制视图坐标
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              //手势识别
              child: Container(
                  color: Colors.red, width: 50, height: 50), //红色子视图
              onTap: () => print("Tap"), //点击回调
              onDoubleTap: () => print("Double Tap"), //双击回调
              onLongPress: () => print("Long Press"), //长按回调
              onPanUpdate: (e) {
                //拖动回调
                setState(() {
                  //更新位置
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
