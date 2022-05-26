
import 'package:flutter/material.dart';
import 'log_util.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  void initState() {
    // TODO: implement initState
    logUtil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logUtil();

    return Scaffold(
      appBar: AppBar(title: const Text("Second Page"),),
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
  void didUpdateWidget(covariant SecondPage oldWidget) {
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

    // TODO: implement dispose
    super.dispose();
  }
}
