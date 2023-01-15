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
      body: Container(),
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
