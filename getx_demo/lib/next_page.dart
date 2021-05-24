import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/count_controller.dart';

class NextPage extends StatelessWidget {

  final CountController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Next Page"),),
      body: Center(
        child: Text("${controller.count}"),
      )
    );
  }
}
