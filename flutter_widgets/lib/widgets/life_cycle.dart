import 'package:flutter/material.dart';

import '../tools/log_util.dart';

class LifeCyclePage extends StatefulWidget {
  const LifeCyclePage({Key? key}) : super(key: key);

  @override
  State<LifeCyclePage> createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    log();
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    log();
    return Scaffold(
      appBar: AppBar(
        title: const Text("LifeCyclePage"),
      ),
      body: TextButton(
        onPressed: () {},
        child: const Text('Enabled',),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
          backgroundColor: Colors.green,
          foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.black, width: 1),
            textStyle: const TextStyle(fontSize: 20, color: Colors.red),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    log();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    log();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    log();

    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    // TODO: implement dispose
    log();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    logUtil("state = $state");
    super.didChangeAppLifecycleState(state);
  }
}
