import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {


  late Isolate _isolate;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Isolate"),
      body:  Center(
        child: ElevatedButton(
          onPressed: () {
            createIsolate();
          },
          child: const Text('执行Isolate'),
        ),
      ),
    );
  }



  start() async {
    // 创建管道
    ReceivePort receivePort = ReceivePort();
    
    _isolate = await Isolate.spawn((message) {}, "")
  }



  /// 使用Isolate需要顶级函数或者static
  static void createIsolate() {
    Isolate.spawn((message) {doSth(message);}, "hi");
  }
  static doSth(msg) => debugPrint(msg);

}
