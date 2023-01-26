
import 'package:flutter/material.dart';
import 'package:flutter_demo/getx/getx_demo_controller.dart';
import 'package:get/state_manager.dart';

class GetxDemoPage extends StatelessWidget {
  const GetxDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = GetxDemoController();

    return Scaffold(
      appBar: AppBar(

        title: const Text("GetX Demo"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Obx(() => Text(
              '${controller.counter.value}',
              style: Theme.of(context).textTheme.headline4,
            )),

            // Image.asset("name"),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

