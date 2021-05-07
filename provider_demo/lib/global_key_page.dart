import 'package:flutter/material.dart';
class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({Key key}) : super(key: key);

  @override
  _GlobalKeyPageState createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey Demo"),
      ),
      body: Container(),
    );
  }
}
