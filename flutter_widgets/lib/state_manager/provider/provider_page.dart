import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/change_notifier_widget.dart';
import 'package:flutter_widgets/state_manager/provider/multi_provider_page.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';

import 'future_provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final List<ClickWidget> _data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Provider"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Wrap(
                  children: [
                    ClickWidget(
                      widgetBean: WidgetBean(
                        title: "FutureProvider",
                        page: const FutureProviderPage(),
                      ),
                    ),
                    ClickWidget(
                      widgetBean: WidgetBean(
                        title: "ChangeNotifierProvider",
                        page: ChangeNotifierPage(),
                      ),
                    ),
                    ClickWidget(
                      widgetBean: WidgetBean(
                        title: "MultiProvider",
                        page: MultiProviderPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
