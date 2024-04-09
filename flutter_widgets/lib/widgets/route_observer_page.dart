

import 'package:flutter/material.dart';
import 'package:flutter_widgets/main.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/widgets/touch_page.dart';
import 'package:get/route_manager.dart';

class RouteObserverPage extends StatefulWidget {
  final Color color;
  const RouteObserverPage({super.key, required this.color});

  @override
  State<RouteObserverPage> createState() => _RouteObserverPageState();
}

class _RouteObserverPageState extends State<RouteObserverPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Get.to(()=>TouchPage());
        },
        child: Container(
          color: widget.color,
          width: 100,
          height: 100,

        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // TODO: implement didPush
    logUtil("didPush");
    super.didPush();
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
    logUtil("didPushNext");
    super.didPushNext();
  }

  @override
  void didPop() {
    // TODO: implement didPop
    logUtil("didPop");
    super.didPop();
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
    logUtil("didPopNext");
    super.didPopNext();
  }
}
