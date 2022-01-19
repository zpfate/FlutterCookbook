import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    String name = "\u{65}\u{301}";
    print("name === $name");
    print("name[0] === ${name[0]}");
    print("name.length=== ${name.length}");




    return  GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}

