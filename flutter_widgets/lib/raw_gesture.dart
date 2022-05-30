import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/log_util.dart';

class RawGesturePage extends StatefulWidget {
  const RawGesturePage({Key? key}) : super(key: key);

  @override
  State<RawGesturePage> createState() => _RawGesturePageState();
}

class _RawGesturePageState extends State<RawGesturePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RawGestureDetector"),),
      body: RawGestureDetector(
        gestures: {
          MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>(
              ()=> MultipleTapGestureRecognizer(), (MultipleTapGestureRecognizer instance) {
                instance.onTap = () => logUtil(message: 'parent tapped');
            },
          ),
        },
        child: Container(
          color: Colors.pinkAccent,
          child: Center(
            child: GestureDetector(
              onTap: ()=> logUtil(message: "Child tapped"),
              child: Container(

              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {

  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
    // super.rejectGesture(pointer);
    acceptGesture(pointer);
  }

}
