import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {

  final StreamController<String> _streamController = StreamController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title:"StreamBuilder Demo"),
      body: StreamBuilder<String>(builder: (ctx, snapshot) {
        String? data = snapshot.data;
        return Center(
            child: Text(data ?? "", style: TextStyle(color: data == "更新完成~" ? Colors.red : Colors.black),)
        );
      },
        initialData: "等待更新ing",
        stream: _streamController.stream,
      ),
    );;
  }



  Future<void> _getData() async {
    await Future.delayed(const Duration(seconds: 1));
    _streamController.add("更新完成~");
  }

  @override
  void dispose() {
    _streamController.close();
    // TODO: implement dispose
    super.dispose();
  }
}



