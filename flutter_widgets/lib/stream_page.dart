import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
class StreamPage extends StatelessWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: defaultAppBar(title: "Stream"),
      body: Column(
        children: [
          ClickWidget(
            widgetBean: WidgetBean(
                title: "fromFuture",
                onPressed: () {
                  _streamFromFuture();
                }
            ),
          ),

          ClickWidget(
            widgetBean: WidgetBean(
                title: "fromFutures",
                onPressed: () {
                  _streamFromFutures();
                }
            ),
          ),
          ClickWidget(
            widgetBean: WidgetBean(
                title: "StreamController",
                onPressed: () {
                  _streamControllerExample();
                }
            ),
          ),

          ClickWidget(
            widgetBean: WidgetBean(
                title: "async *异步生成器",
                onPressed: () {
                  _asyncExample();
                }
            ),
          ),
          ClickWidget(
            widgetBean: WidgetBean(
                title: "StreamController.broadcast",
                onPressed: () {
                  _asyncExample();
                }
            ),
          ),
        ],
      ),
    );
  }

  /// Stream.fromFuture 接收一个Future对象作为参数
  void _streamFromFuture() {
  Stream stream = Stream<String>.fromFuture(getData(1));
  stream.listen((event) {
    logUtil(event);
  },
    onDone: () {
      logUtil("fromFuture -- done");
  },
    onError: (msg) {
      logUtil("fromFuture--error=" + msg);
    }
    );
  }

  /// Stream.fromFutures 接收Future对象数组作为参数
  void _streamFromFutures() {
    Stream stream = Stream<String>.fromFutures([getData(1), getData(2), getData(3)]);
    stream.listen((event) {
      logUtil(event);
    },
        onDone: () {
          logUtil("fromFuture -- done");
        },
        onError: (msg) {
          logUtil("fromFuture--error=" + msg);
        }
    );
  }


  /// StreamController
  void _streamControllerExample() {
    StreamController<String> controller = StreamController();
    StreamSubscription<String> streamSubscription = controller.stream.listen((event) {
        logUtil(event);
      },
      onDone: () {
        logUtil("controller.onDone");
      },
      onError: (err) {
        logUtil("controller.onError: $err");
      },
    );

    streamSubscription.onDone(() {
      logUtil("streamSubscription.onDone");
    });

    /// 多通道订阅可以添加Stream流
    // controller.addStream(source)
    controller.add("streamController.add");
    controller.addError("streamController.error");
    controller.sink.add("streamController.sink.add");
    controller.close();
    // streamSubscription.cancel();
    ///StreamController使用完成,需要close()
    /// StreamSubscription需要cancle()
    /// (在此例中,streamSubscription.cancel()了, 订阅者就收不到消息了,所以实际使用时一般可在State的dispose方法中调用)
  }

  /// 异步生成器
  void _asyncExample() {
    countStream(9).listen((event) {
      logUtil(event.toString());
    });
  }

  /// 返回从1-> to的序列流
  Stream<int> countStream(int to) async* {
    /// async*异步生成器
    for (int i = 1; i <= to; i++) {
      /// yield它用于从流中发出值。
      /// yield*它委派给另一个生成器，并且在另一个生成器停止生成值之后，它会继续生成自己的值。
      yield i;
    }
  }

  Future<String> getData(num value) async {
    await Future.delayed(const Duration(seconds: 1));
    return "future string:$value";
  }

}
