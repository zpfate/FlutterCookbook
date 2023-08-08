import 'package:flutter/material.dart';
import 'package:flutter_demo/getx/getx_demo.dart';
import 'package:flutter_demo/getx/login_page.dart';
import 'package:flutter_demo/list_view.dart';
import 'package:flutter_demo/testxxx.dart';
import 'package:flutter_demo/textfield_page.dart';
import 'package:flutter_demo/widget/key_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts_page.dart';

void main() {

  num x = 0.105;
  print("${x.toStringAsFixed(2)}");

 

  runApp(const MyApp());

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  List<int> dailyTemperatures(List<int> temperatures) {
    var results = List.filled(temperatures.length, 0);
    var stacks = [];

    for (int i = 0; i < temperatures.length; i++) {
      while (stacks.isNotEmpty && temperatures[i] > temperatures[stacks.last]) {
        int temp = stacks.removeLast();
        results[temp] = i - temp;
      }
      stacks.add(i);
    }
    return results;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (ctx, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          // showSemanticsDebugger	: true,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
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

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // ElevatedButton(onPressed: () {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  HoveringHeaderListDemo()));
            // }, child: const Text("ListView Drop Header")),


            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginPage()));
            }, child: const Text("LoginPage")),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ListViewPage()));
            }, child: const Text("ListView")),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const GetxDemoPage()));
            }, child: const Text("GetX Counter")),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const KeyPage()));
            }, child: const Text("Flutter Demo")),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const TextFieldPage()));
            }, child: const Text("TEXT Demo")),

            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const FontsPage()));
            }, child: Text("字体")),
            // Image.asset("name"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
