import 'package:flutter/material.dart';
import 'package:flutter_widgets/method_channel/method_channel_util.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';

class MethodChannelPage extends StatefulWidget {
  const MethodChannelPage({Key? key}) : super(key: key);

  @override
  State<MethodChannelPage> createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Method Channel"),
      body: Column(
        children: [
          ClickWidget(
            widgetBean: WidgetBean(
                title: "MethodChannel",
              onPressed: () {
                MethodChannelUtil.openAppMarket();
              }
              ),
          ),

          ClickWidget(
            widgetBean: WidgetBean(
                title: "BasicMethodChannel",
                onPressed: () {
                  MethodChannelUtil.openAppMarket2();
                }
            ),
          ),
        ],
      ),
    );
  }
}
