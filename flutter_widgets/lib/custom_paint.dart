import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CustomPainter"),),
      body: CustomPaint(
        size: const Size(200, 200),
        painter: WheelPainter(),
      ),
    );
  }
}

class WheelPainter extends CustomPainter {

  // 设置画笔颜色
  Paint getColoredPaint(Color color) {
    //根据颜色返回不同的画笔
    Paint paint = Paint();//生成画笔
    paint.color = color;//设置画笔颜色
    return paint;
  }

  /// 绘制逻辑
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    /// 饼图的尺寸
    double wheelSize = min(size.width, size.height) / 2;
    /// 分成6份
    double nbElem = 6;
    /// 1/6圆
    double radius = (2 * pi) / nbElem;
    /// 包过饼图的矩形框

    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize, wheelSize), radius: wheelSize);

    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.black38));
    canvas.drawArc(boundingRect, radius * 2, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(boundingRect, radius * 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.pink));
  }
// 判断是否需要重绘，这里我们简单的做下比较即可
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

