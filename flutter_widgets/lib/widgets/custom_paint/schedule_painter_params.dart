import 'dart:ui';

import 'package:flutter/animation.dart';

class SchedulePainterParams {
  final DateTime start;
  final DateTime end;
  final Size size;
  final double margin;
  final double xShift;
  SchedulePainterParams(
      {required this.start,
      required this.end,
      required this.size,
      required this.margin,
      required this.xShift});

  double get width {
    return size.width;
  }

  double get height {
    return size.height;
  }

  double get itemWidth => 24;

  String weekdayText(int weekday) {
    return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][weekday - 1];
  }

  static SchedulePainterParams lerp(
      SchedulePainterParams a, SchedulePainterParams b, double t) {
    double lerpField(double getField(SchedulePainterParams p)) =>
        lerpDouble(getField(a), getField(b), t)!;
    return SchedulePainterParams(
      start: b.start,
      end: b.end,
      size: b.size,
      margin: b.margin,
      xShift: b.xShift,
    );
  }
}

class SchedulePainterParamsTween extends Tween<SchedulePainterParams> {
  SchedulePainterParamsTween({
    SchedulePainterParams? start,
    required SchedulePainterParams end,
  }) : super(begin: start, end: end);

  @override
  SchedulePainterParams lerp(double t) =>
      SchedulePainterParams.lerp(begin ?? end!, end!, t);
}
