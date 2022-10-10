import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/getx/get_builder_controller.dart';
import 'package:flutter_widgets/state_manager/getx/getx_page_controller.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:get/get.dart';

class GetBuilderPage extends StatelessWidget {
  const GetBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastController = Get.find<GetXPageController>();

    final _controller = Get.put(GetBuilderControlelr());
    return Scaffold(
      appBar: defaultAppBar(title: "GetBuilder Demo"),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('lastController count++')),
            GetBuilder<GetXPageController>(builder: (controller) {
              return Container(
                color: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  lastController.count.toString(),
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  _controller.incrementCount1();
                },
                child: const Text('count1++')),
            GetBuilder<GetBuilderControlelr>(
                id: "count1",
                builder: (controller) {
                  return Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      _controller.count1.toString(),
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  _controller.incrementCount2();
                },
                child: const Text('count2++')),
            GetBuilder<GetBuilderControlelr>(builder: (controller) {
              return Container(
                color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  _controller.count2.toString(),
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
