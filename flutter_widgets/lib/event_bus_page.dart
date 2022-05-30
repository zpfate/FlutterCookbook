import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/navigator_extension.dart';

/// Event bus通知对象
class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

/// //建立公共的event bus
EventBus _eventBus = EventBus();

class EventBusPage extends StatefulWidget {
  const EventBusPage({Key? key}) : super(key: key);

  @override
  State<EventBusPage> createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {

  String _msg = "通知:";
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    _streamSubscription = _eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        _msg += event.msg;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Event Bus"),
      body: Column(
        children: [
          Text(_msg),
          ElevatedButton(onPressed: ()=> push(context, const EventBusNextPage()), child: const Text('next'))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription.cancel();
    super.dispose();
  }
}

class EventBusNextPage extends StatelessWidget {
  const EventBusNextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "EventBusNextPage"),
      body: ElevatedButton(
        onPressed: () {
          _eventBus.fire(CustomEvent("hello"));
        },
        child: const Text('Fire Event'),
      ),
    );
  }
}


