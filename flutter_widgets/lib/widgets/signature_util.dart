
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {

  late final GlobalKey _globalKey;

  final List<Offset?> _points = [];

  @override
  void initState() {
    // TODO: implement initState
    //横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    _globalKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.blue, child: signWidget(),)),
          Row(
            children: [


            ],
          )
        ],
      ),
    );
  }


  Widget signWidget() {
    return RepaintBoundary(
      key: _globalKey,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onPanStart: (DragStartDetails details) {
              // _points.clear();
            },
            onPanUpdate: (DragUpdateDetails details) {
              RenderObject? renderBox = context.findRenderObject();
              Offset localPosition = details.localPosition;
              RenderObject? referenceBox =
              _globalKey.currentContext?.findRenderObject();

              // //校验范围，防止超过外面
              // if (localPosition.dx <= 0 || localPosition.dy <= 0) return;
              // if (localPosition.dx > referenceBox.size?.width ||
              //     localPosition.dy > referenceBox?.size?.height) return;

              setState(() {
                _points.add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails details) {
              _points.add(null);
            },
          ),
          Container(
            color: Colors.white,
            child:  CustomPaint(
                painter: SignaturePainter(points: _points,)
            ),
          )
          ,
          // Image.file(
          //   File(_imageLocalPath ?? ""),
          //   height: 100,
          //   width: 100,
          // )
        ],
      ),
    );
  }
}


class SignaturePainter extends CustomPainter {

  final List<Offset?> points;
  final double strokeWidth;
  const SignaturePainter({ required this.points, this.strokeWidth = 8});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.red
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }    }

  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return true;
  }
}