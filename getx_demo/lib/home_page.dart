import 'package:flutter/material.dart';
import 'package:getx_demo/count_controller.dart';
import 'package:get/get.dart';
import 'package:getx_demo/next_page.dart';
import 'package:getx_demo/textfield_associate_menu.dart';
class Homepage extends StatelessWidget {
   Homepage({Key? key}) : super(key: key);

  GlobalKey _textKey = GlobalKey();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final CountController controller = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Counter Demo"),
      ),
      body: Container(
        key: _textKey,
        child: TextField(
          controller: _controller,
          onChanged: (text) {

              List<String> list = ["123", "223", "2355", "233666", "23445555"];

              List<String> newTextList = [];
              for(var str in list) {
                if (str.contains(text)) {
                  newTextList.add(str);
                }
              }
              TextFieldAssociateMenu.showOverlay(context,
                  globalKey: _textKey,
                  list: newTextList, onSelected: (index) {
                    _controller.text = list[index];
                  }
              );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }

  Widget _getxWidget(CountController controller) {
    return Column(
      children: [
        ElevatedButton(
          /// 使用简单的Get.to代替Navigator.push
            onPressed: ()=> Get.to(()=>NextPage()),
            child: Text("Get to NextPage")),
        /// 使用Obx(()=>每当改变计数时，就更新Text()。
        Obx(()=> Text("clicks:${controller.count}")),
      ],
    );
  }

}
