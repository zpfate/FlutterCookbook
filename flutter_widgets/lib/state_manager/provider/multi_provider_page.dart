import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:provider/provider.dart';

class MultiCounter with ChangeNotifier {
  var count = 0;
  increment() {
    count++;
    notifyListeners();
  }
}

class MultiCounter2 with ChangeNotifier {
  var count = 10;
  increment() {
    count++;
    notifyListeners();
  }
}

class MultiProviderPage extends StatelessWidget {
  MultiProviderPage({Key? key}) : super(key: key);

  final MultiCounter _multiCounter = MultiCounter();
  final MultiCounter2 _multiCounter2 = MultiCounter2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "MultiProvider"),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: _multiCounter2),
          ChangeNotifierProvider.value(value: _multiCounter),
        ],
        child: _buildBodyWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _multiCounter.increment();
        _multiCounter2.increment();
      }),
    );
  }

  Widget _buildBodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<MultiCounter>(
            builder: (context, value, child) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  value.count.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.amber,
              );
            },
          ),
          Consumer<MultiCounter2>(
            builder: (context, value, child) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  value.count.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.green,
              );
            },
          ),
        ],
      ),
    );
  }
}
