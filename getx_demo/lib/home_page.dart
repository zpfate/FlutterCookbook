import 'package:flutter/material.dart';
import 'package:getx_demo/count_controller.dart';
import 'package:get/get.dart';
import 'package:getx_demo/next_page.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final CountController controller = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Counter Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              /// 使用简单的Get.to代替Navigator.push
                onPressed: ()=> Get.to(()=>NextPage()),
                child: Text("Get to NextPage")),
            /// 使用Obx(()=>每当改变计数时，就更新Text()。
            Obx(()=> Text("clicks:${controller.count}")),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }


  Widget _selectItemWidget({String title, Function onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(title, style: TextStyle(fontSize: 16),)
    );
  }
}
