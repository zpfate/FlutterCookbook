import 'package:flutter/material.dart';

import 'log_util.dart';

class LifeCyclePage extends StatefulWidget {
  const LifeCyclePage({Key? key}) : super(key: key);

  @override
  State<LifeCyclePage> createState() => _LifeCyclePageState();
}

class _LifeCyclePageState extends State<LifeCyclePage> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    logUtil();
    super.initState();

    WidgetsBinding.instance?.addObserver(this);

  }

  @override
  Widget build(BuildContext context) {
    logUtil();
    return Scaffold(
      appBar: AppBar(title: const Text("LifeCyclePage"),),
      body: Container(),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    logUtil();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    logUtil();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    logUtil();
    super.deactivate();
  }

  @override
  void dispose() {
    logUtil();
    WidgetsBinding.instance?.removeObserver(this);

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    logUtil(message: "state = $state");
    super.didChangeAppLifecycleState(state);
  }

}
