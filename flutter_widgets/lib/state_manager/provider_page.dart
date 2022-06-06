import 'package:flutter/material.dart';
import 'package:flutter_widgets/state_manager/counter_model.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider.value(
      value: CounterModel(),
      child: Scaffold(
          appBar: defaultAppBar(title: "Provider"),
          body: const ProviderFirstPage(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                push(context, const ProviderNextPage());
              }
              )
      ),
    );
  }
}

class ProviderFirstPage extends StatelessWidget {
  const ProviderFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _counter = Provider.of<CounterModel>(context);

    return Text('Counter: ${_counter.counter}');
  }
}


class ProviderNextPage extends StatelessWidget {
  const ProviderNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: defaultAppBar(title: "Provider Next Page"),
      body: ChangeNotifierProvider(
        create: ,
        builder: (ctx, child) {
          return Text('Counter: ${_counter.counter}');
        },
      ),
      /// 用资源更新方法来设置按钮点击回调
      floatingActionButton:FloatingActionButton(
        onPressed: _counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

