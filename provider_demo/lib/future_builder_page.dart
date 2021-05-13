import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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
      body: Center(
        child: FutureBuilder(
          future: futureAlbumn(),
          builder: (context, snapshot) {
            String text = snapshot.data;
            return Text(text, style: TextStyle(fontSize: 30, color: Colors.red),);
          },

        ),
      ),
    );
  }


  Future futureAlbumn() {

    var response = Dio().get('https://jsonplaceholder.typicode.com/albums/1');
    return response;

  }


  Future<String> getAsyncText() {
    return Future.value("future text");
  }

}
