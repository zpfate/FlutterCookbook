import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:get/route_manager.dart';

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
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const RouteNextPage()));
              },
              child: const Text('push next page')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("r");
              },
              child: const Text('push unknown page')),
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

class Route1Page extends StatelessWidget {
  const Route1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Route1Page"),
      body: ElevatedButton(
        onPressed: () {
          Get.to(() => Route2Page());
        },
        child: Text("get.to"),
      ),
    );
  }
}

class Route2Page extends StatelessWidget {
  const Route2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(title: "Route2Page"),
        body: Column(children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => Route2Page(), preventDuplicates: false);
            },
            child: Text("get.to2"),
          ),

          ElevatedButton(
            onPressed: () {
              Get.to(() => Route3Page(), preventDuplicates: false);
            },
            child: Text("get.to3"),
          ),
        ]));
  }
}

class Route3Page extends StatelessWidget {
  const Route3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Route3Page"),
      body: ElevatedButton(
        onPressed: () {
          // Get.until((route) => route.settings.name == "/r1");

          Get.until((route) {
            debugPrint("route === ${(route as GetPageRoute).routeName}");
            return (route).routeName == "/Route1Page";
          });
        },
        child: Text("get.off"),
      ),
    );
  }
}
