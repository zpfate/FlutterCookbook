import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/getx/getx_page_controller.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:get/get.dart';

class GetXPage extends StatefulWidget {
  const GetXPage({Key? key}) : super(key: key);

  @override
  State<GetXPage> createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {
  final GetXPageController _controller = Get.put(GetXPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "GetX"),
      body: Column(
        children: [
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "snackbar",
                  onPressed: () {
                    Get.snackbar("标题", "这是一个snackbar");
                  })),
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "defaultDialog",
                  onPressed: () {
                    Get.defaultDialog(
                        title: "标题", content: const Text("这是一个defaultDialogs"));
                  })),
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "dialog",
                  onPressed: () {
                    Get.dialog(Center(
                      child: Material(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            color: Colors.white,
                            child: const Text("这是一个dialog")),
                      ),
                    ));
                  })),
          Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: Obx(
                () => Text(
                  _controller.count.toString(),
                  style: const TextStyle(fontSize: 25, color: Colors.green),
                ),
              )),
          GetBuilder(
            builder: (GetXPageController controller) {
              return Container();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
