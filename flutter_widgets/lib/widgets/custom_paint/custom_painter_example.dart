import 'package:flutter/material.dart';

class CustomPainterExample extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // 绘制一个矩形
    Rect rect = Rect.fromLTWH(0, 0, 50, 50);
    canvas.drawRect(rect, paint);

    // 平移画布到新的位置
    canvas.translate(100, 100);

    // 绘制一个圆形
    canvas.drawCircle(Offset(0, 0), 25, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
