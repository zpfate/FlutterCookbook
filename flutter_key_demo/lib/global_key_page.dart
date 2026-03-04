import "package:flutter/material.dart";

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({Key? key}) : super(key: key);

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {
  final GlobalKey<_ChildPageState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Global Key"),
      ),
      body: ChildPage(
        key: _key,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _key.currentState?.count++;
          _key.currentContext?.findRenderObject();
          //  _key.currentWidget
        },
      ),
    );
  }
}

class ChildPage extends StatefulWidget {
  const ChildPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text("$count");
  }
}
