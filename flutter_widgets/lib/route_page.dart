
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Route"),
      body: Column(
         children: [
           ElevatedButton(
             onPressed: () {
               Navigator.of(context).pop();
             },
             child: const Text('pop'),
           ),
           ElevatedButton(
               onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RouteNextPage()));
               }, 
               child: const Text('push next page')
           ),
           ElevatedButton(
               onPressed: () {
                 Navigator.of(context).pushNamed("r");
               },
               child: const Text('push unknown page')
           ),
         ],
      ),
    );
  }
}


class RouteNextPage extends StatelessWidget {
  const RouteNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "RouteNextPage"),
    );
  }
}

class RouteUnknownPage extends StatelessWidget {
  const RouteUnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "RouteUnknownPage"),
    );
  }
}


