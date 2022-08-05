import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/counter.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:provider/provider.dart';

import 'future_provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {

  List<ClickWidget> _data = [];

  late Widget _currentWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _data.addAll([
      ClickWidget(widgetBean: WidgetBean(title: "FutureProvider")),
    ]);
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
                  children: _data,
                ),
              ],
            ),
          ),
          const Expanded(child: FutureProviderWidget()),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<Counter>(context).increment();
      },
        child: const Icon(Icons.add),
      ),
    );
  }


}





