import 'package:flutter/material.dart';
class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutrureBuilder Demo"),
      ),
      body: FutureBuilder(builder: null),
    );
  }
}
