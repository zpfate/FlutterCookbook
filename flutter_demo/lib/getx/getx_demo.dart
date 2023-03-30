
import 'package:flutter/material.dart';
import 'package:flutter_demo/getx/getx_demo_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class GetxDemoPage extends StatelessWidget {
  const GetxDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(GetxDemoController());

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
              'Obx:${controller.counter.value}',
              style: Theme.of(context).textTheme.headline4,
            )),

            const SizedBox(height: 40,),
            GetBuilder(builder: (GetxDemoController controller) {
              return Text('GetBuilder: ${controller.count}', style: const TextStyle(fontSize: 30, color: Colors.red),);
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 1,
            onPressed: controller.incrementCount,
            child: const Icon(Icons.add_alarm_outlined),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

