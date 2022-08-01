import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/provider/counter_model.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:provider/provider.dart';

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

          Expanded(child: _providerWidget()),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<CounterModel>(context).increment();
      },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _providerWidget() {
    return Provider(
        create: (ctx) => CounterModel(),
      child: Text('${Provider.of<CounterModel>(context).counter}'),
    );
  }

  
  Widget _futureProvider() {
    return FutureProvider(
        create: (ctx)=> Future.value(42), 
        initialData: 12,
      child: Text(''),
    );
  }


}


