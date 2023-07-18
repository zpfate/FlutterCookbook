import 'package:decimal/decimal.dart';
import 'package:ebang_flutter_ui/clear_textfield.dart';
import 'package:ebang_flutter_ui/num_utils.dart';
import 'package:ebang_flutter_ui/title_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      const TitleText(title: "dddd", content: "kkkk", axis: Axis.vertical, verticalMargin: 10,),
      const ClearTextField(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }

  Widget _widgetsGrid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Container();
        });
  }
}
