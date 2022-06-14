import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
class StreamPage extends StatelessWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var stream = countStream(10);
    // var sum = await sumStream(stream);

    if (Platform.isIOS) {
    }

    return Scaffold(
      appBar: defaultAppBar(title: "Stream"),
      // body: ,
    );
  }

  
  void _streamFromFuture() {
    Stream stream = Stream.fromFuture(Future.delayed(const Duration( seconds: 1), () {
      return "Hello Stream";
    }));

    stream.listen((event) {
     logUtil(message: "$event");
    }, onError: (e) {
      print("onError");

    },onDone: () {
      print("onDone");
    }
    );
  }
  
  
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;
    await for(var value in stream) {
      sum += value;
    }
    return sum;
  }

  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to; i++) {
      yield i;
    }
  }


}
