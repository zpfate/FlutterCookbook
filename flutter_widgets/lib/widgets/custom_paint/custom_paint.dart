import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/custom_paint/custom_painter_example.dart';
import 'package:flutter_widgets/widgets/custom_paint/schedule_painter.dart';

class CustomPaintPage extends StatelessWidget {

  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CustomPainter"),),
      body: GestureDetector(
        onPanUpdate: (details) {
          debugPrint("1111");
        },
        child: SizedBox(
          width: 200,
          height: 100,
          child: CustomPaint(
            painter: CustomPainterExample(),
            size: const Size(200, 100),
          ),
        ),
      ),
    );
  }
}





class CirclePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint _paint2 = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    const Rect rect = Rect.fromLTRB(50, 50, 150, 150);
    const Rect rect2 = Rect.fromLTRB(60, 60, 150, 150);

    /// 参数依次是：矩形范围、开始弧度、结束弧度、是否连接圆心、画笔
    canvas.drawArc(rect, 0, pi + 1, false, _paint2);
    canvas.drawArc(rect2, pi, pi +1, false, _paint);


  }
// 判断是否需要重绘，这里我们简单的做下比较即可
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
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

