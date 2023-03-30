import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/key/key_page.dart';
import 'package:flutter_widgets/widgets/InheritedWidget/inherited_page.dart';
import 'package:flutter_widgets/widgets/animated_builder_page.dart';
import 'package:flutter_widgets/dart/change_notifier_demo.dart';
import 'package:flutter_widgets/widgets/animated_widget_page.dart';
import 'package:flutter_widgets/widgets/animation_page.dart';
import 'package:flutter_widgets/widgets/custom_paint.dart';
import 'package:flutter_widgets/widgets/dropdown_textfield.dart';
import 'package:flutter_widgets/widgets/event_bus_page.dart';
import 'package:flutter_widgets/widgets/future_page.dart';
import 'package:flutter_widgets/widgets/hero_page.dart';
import 'package:flutter_widgets/widgets/isolate_page.dart';
import 'package:flutter_widgets/widgets/life_cycle.dart';
import 'package:flutter_widgets/widgets/listener_page.dart';
import 'package:flutter_widgets/local_storage/local_storage_page.dart';
import 'package:flutter_widgets/method_channel/method_channel_page.dart';
import 'package:flutter_widgets/network.dart';
import 'package:flutter_widgets/widgets/notification.dart';
import 'package:flutter_widgets/widgets/platform_view_page.dart';
import 'package:flutter_widgets/state_manager/state_manager_page.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:flutter_widgets/widgets/route_page.dart';
import 'package:flutter_widgets/widgets/sliver.dart';
import 'package:flutter_widgets/widgets/stream_builder_page.dart';
import 'package:flutter_widgets/widgets/stream_page.dart';
import 'package:flutter_widgets/widgets/touch_page.dart';
import 'package:get/route_manager.dart';

void main() {
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print(flutterErrorDetails.toString());
    return const Scaffold(
        body: Center(
      child: Text("页面加载出错~"),
    ));
  };

  runZonedGuarded(() {
    runApp(const MyApp());



    // Person full = Person().f
  }, (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  logUtil('Caught error: $error');

  logUtil('Reporting to Bugly...');

  // FlutterCrashPlugin.postException(error, stackTrace);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      //注册路由
      routes: {
        "route_next": (context) => const RouteNextPage(),
      },
      //错误路由处理，统一返回UnknownPage
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => const RouteUnknownPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _data = [];

  @override
  void initState() {
    super.initState();

    List<WidgetBean> list = [
      WidgetBean(title: "Lifecycle", page: const LifeCyclePage()),
      WidgetBean(title: "Sliver", page: const SliverPage()),
      WidgetBean(title: "CustomPaint", page: const CustomPaintPage()),
      WidgetBean(title: "Listener", page: const ListenerPage()),
      WidgetBean(title: "GestureDetector", page: const GestureDetectorPage()),
      WidgetBean(title: "RawGestureDetector", page: const RawGestureDetector()),
      WidgetBean(title: "InheritedWidget", page: const InheritedPage()),
      WidgetBean(title: "Notification", page: const NotificationPage()),
      WidgetBean(title: "EventBus", page: const EventBusPage()),
      WidgetBean(title: "ChangeNotifier", page: ChangeNotifierDemoPage()),
      WidgetBean(title: "Route", page: const RoutePage()),
      WidgetBean(title: "Animation", page: const AnimationPage()),
      WidgetBean(title: "AnimatedWidget", page: const AnimatedWidgetPage()),
      WidgetBean(title: "AnimatedBuilder", page: const AnimatedBuilderPage()),
      WidgetBean(title: "Hero", page: const HeroPage()),
      WidgetBean(title: "Future", page: const FuturePage()),
      WidgetBean(title: "Isolate", page: const IsolatePage()),
      WidgetBean(title: "Network", page: const NetworkPage()),
      WidgetBean(title: "本地化持久", page: LocalStoragePage()),
      WidgetBean(title: "Method Channel", page: const MethodChannelPage()),
      WidgetBean(title: "Platform View", page: const PlatformViewPage()),
      WidgetBean(title: "状态管理", page: const StateManagerPage()),
      WidgetBean(title: "Stream", page: const StreamPage()),
      WidgetBean(title: "PopupRoute", page: const PopupRoutePage()),
      WidgetBean(title: "StreamBuilder", page: const StreamBuilderPage()),
      WidgetBean(title: "Key", page: const KeyPage()),
    ];

    for (var element in list) {
      _data.add(ClickWidget(widgetBean: element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Wrap(
            children: _data,
          ),
        ],
      )),
    );
  }
}
