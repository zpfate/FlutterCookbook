import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/widgets/custom_paint/schedule_painter_params.dart';

class SchedulePainter extends StatefulWidget {
  final double itemWidth;
  final DateTime startTime;
  final DateTime endTime;
  const SchedulePainter(
      {super.key,
      required this.itemWidth,
      required this.startTime,
      required this.endTime});

  @override
  _SchedulePainterState createState() => _SchedulePainterState();
}

class _SchedulePainterState extends State<SchedulePainter> {
  SchedulePainterParams? _params;
  double? _startOffset;
  late Offset _initialFocalPoint;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "SchedulePainter"),
      body: _scheduleWidget(),
    );
  }

  /// 安排表
  Widget _scheduleWidget() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Size size = constraints.biggest;
      double margin = (size.width - 24 * 7) / 7;

      DateTime past = DateTime.now();
      DateTime now = DateTime.now();
      DateTime later = now.add(const Duration(days: 50));

      double containerWidth = margin + widget.itemWidth;
      _handleStartOffset(past, now, later, size.width, containerWidth);

      final int start = (_startOffset! / containerWidth).floor();
      final int count = (size.width / containerWidth).ceil();

      final halfCandle = (widget.itemWidth + margin) / 2;
      final fractionCandle = _startOffset! - start * containerWidth;
      double xShift = halfCandle - fractionCandle;
      debugPrint("xShift ===== $xShift");
      debugPrint(
          "开始日期:${past.add(Duration(days: start)).toString()} 结束日期:${past.add(Duration(days: start + count)).toString()}");

      _params = SchedulePainterParams(
          start: past.add(Duration(days: start)),
          end: past.add(Duration(days: start + count)),
          size: size,
          margin: margin,
          xShift: xShift);

      return GestureDetector(
        onPanStart: (details) => _onHorizontalDragStart(details.localPosition),
        onPanUpdate: (details) =>
            _onHorizontalDragUpdate(details.localPosition, size.width, containerWidth),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: TweenAnimationBuilder(
            tween: SchedulePainterParamsTween(
              end: _params!,
            ),
            curve: Curves.easeOut,
            builder: (_, SchedulePainterParams params, __) {
              return RepaintBoundary(
                child: CustomPaint(
                  painter: _SchedulePainter(params: _params!),
                ),
              );
            }, duration: const Duration(milliseconds: 300),
          )
        ),
      );
    });
  }

  void _handleStartOffset(
      DateTime past, DateTime now, DateTime later, double w, double itemWidth) {
    if (_startOffset != null) {
      _startOffset = _startOffset!.clamp(
        0,
        _getMaxStartOffset(w, itemWidth),
      );
    } else {
      // int days = now.difference(past).inDays;
      // _startOffset = days * itemWidth;
      _startOffset = 0;
    }
  }

  double _getMaxStartOffset(double w, double candleWidth) {
    final count = 7; // visible candles in the window
    final start = 50 - 7;
    return max(0, candleWidth * start);
  }

  void _onHorizontalDragStart(Offset offset) {
    debugPrint("_onHorizontalDragStart");
    _initialFocalPoint = offset;
  }

  void _onHorizontalDragUpdate(Offset localPoint, double width, double singleWidth) {
    setState(() {
      final dx = (localPoint - _initialFocalPoint).dx * -1;
      _startOffset = _startOffset! + dx;
      _startOffset = _startOffset!.clamp(0, _getMaxStartOffset(width, singleWidth));
      debugPrint("_onHorizontalDragUpdate: ${_startOffset!}");
    });
  }
}

class _SchedulePainter extends CustomPainter {
  final SchedulePainterParams params;
  _SchedulePainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRect(Offset.zero & Size(params.width, params.height));
    canvas.translate(params.xShift, 0);
    _drawCalendar(canvas, size);
    canvas.restore();
  }

  /// 绘制日期表
  void _drawCalendar(Canvas canvas, Size size) {
    int length = params.end.difference(params.start).inDays;

    for (int i = 0; i < length; i++) {
      DateTime currDay = params.start.add(Duration(days: i));
      bool isToday = isSameDay(DateTime.now(), currDay);
      var textStyle =
          TextStyle(color: isToday ? Colors.red : Colors.black, fontSize: 11);
      final textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: params.weekdayText(currDay.weekday),
          style: textStyle,
        ),
      );
      textPainter.layout(
          minWidth: params.itemWidth, maxWidth: params.itemWidth);
      final dx = (params.itemWidth + params.margin) * i;
      textPainter.paint(canvas, Offset(dx + params.margin/2, 0));

      final dayPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: params.start.add(Duration(days: i)).day.toString(),
          style: textStyle,
        ),
      );
      canvas.drawCircle(Offset(dx + params.margin/2 + params.itemWidth / 2, 29), 12,
          Paint()..color = const Color(0xFFF5F5F6));
      dayPainter.layout(minWidth: params.itemWidth, maxWidth: params.itemWidth);
      dayPainter.paint(canvas, Offset(dx + params.margin/2, 29 - 5.5));


      if (isToday) {
        _drawLeftCircleRect(canvas, dx);
      } else {
        if (isSameDay(currDay, DateTime.now().add(Duration(days: 4)))) {
          _drawRightCircleRect(canvas, dx);
        } else{
          if (currDay.isAfter(DateTime.now()) && currDay.isBefore(DateTime.now().add(Duration(days: 4)))) {
          _drawRect(canvas, dx);

          }

        }
      }
    }
  }


  void _drawLeftCircleRect(Canvas canvas, double dx) {

    Rect rect = Rect.fromLTWH(dx + params.margin/3, 60, params.itemWidth + params.margin - params.margin/3, 20);

    Radius radius = const Radius.circular(8);
    RRect rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: radius,
      topRight: Radius.zero,
      bottomLeft: radius,
      bottomRight: Radius.zero,
    );
    canvas.drawRRect(rRect, Paint()..color = Colors.red);
  }

  void _drawRightCircleRect(Canvas canvas, double dx) {

    Rect rect = Rect.fromLTWH(dx, 60, params.itemWidth + params.margin/3 + params.margin/2, 20);

    Radius radius = const Radius.circular(8);

    RRect rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: Radius.zero,
      topRight: radius,
      bottomLeft: Radius.zero,
      bottomRight: radius,
    );
    canvas.drawRRect(rRect, Paint()..color = Colors.red);
  }
  
  void _drawRect(Canvas canvas, double dx) {
    Rect rect = Rect.fromLTWH(dx, 60, params.itemWidth + params.margin, 20);
    canvas.drawRect(rect, Paint()..color = Colors.red);

  }
  

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  bool isSameDay(DateTime dateTime1, DateTime dateTime2) {
    return dateTime1.year == dateTime2.year &&
        dateTime1.month == dateTime2.month &&
        dateTime1.day == dateTime2.day;
  }
}
