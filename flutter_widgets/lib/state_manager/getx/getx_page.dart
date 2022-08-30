import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/getx/getx_page_controller.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
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
      body: GetBuilder(
        builder: (controller) {
          return Container();
        },
      ),
    );
  }
}
