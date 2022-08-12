import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/provider_page.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

import '../tools/widget_bean.dart';

class StateManagerPage extends StatelessWidget {
  const StateManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "状态管理"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClickWidget(
              widgetBean: WidgetBean(
                title: "Provider",
                page: const ProviderPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }





}
