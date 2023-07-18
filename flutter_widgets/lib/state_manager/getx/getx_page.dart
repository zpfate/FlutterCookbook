import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/getx/get_builder_page.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "snackBar",
                  onPressed: () {
                    Get.snackbar("标题", "这是一个snackBar");
                  })),
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "defaultDialog",
                  onPressed: () {
                    Get.defaultDialog(
                        title: "标题", content: const Text("这是一个defaultDialog"));
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
          ClickWidget(
              widgetBean: WidgetBean(
                  title: "bottomSheet",
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        height: 300,
                        color: Colors.white,
                        child: ListView(
                          children: const [
                            ListTile(
                              title: Text("重启"),
                              leading: Icon(Icons.menu_book),
                              trailing: Icon(Icons.arrow_right),
                            ),
                            ListTile(
                              title: Text("注销"),
                              leading: Icon(Icons.book),
                              trailing: Icon(Icons.arrow_right),
                            ),
                            ListTile(
                              title: Text("关机"),
                              leading: Icon(Icons.close),
                              trailing: Icon(Icons.arrow_right),
                            )
                          ],
                        ),
                      ),
                      // isDismissible: false, // 点击空白弹框消失 默认为true
                      enableDrag: false, // 是否允许拖拽
                    );
                  })),
          Container(
              width: 98,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              alignment: Alignment.bottomCenter,
              color: Colors.red,
              child: Column(
                children: [
                  ElevatedButton(
                    child: const Text("Obx"),
                    onPressed: () {

                      _controller.increment();

                    },
                  ),
                  Obx(
                    () => Text(
                      (_controller.count.value + _controller.count2.value).toString(),
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              )),
          GetX<GetXPageController>(builder: (controller) {
            return Container(
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  ElevatedButton(
                    child: const Text("GetX"),
                    onPressed: () {
                      _controller.increment2();
                    },
                  ),
                  Text(
                    controller.count.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            );
          }),
          GetBuilder(
            builder: (GetXPageController controller) {
              return Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  color: Colors.green,
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: const Text(
                          "GetBuilder",
                        ),
                        onPressed: () {
                          Get.to(const GetBuilderPage());
                        },
                      ),
                      Text(controller.count.toString(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white)),
                    ],
                  ),
                ),
              );
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
