import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_widgets/key/key_page.dart';
import 'package:flutter_widgets/tabs/tabs_page.dart';
import 'package:flutter_widgets/widgets/InheritedWidget/inherited_page.dart';
import 'package:flutter_widgets/widgets/animation/animated_builder_page.dart';
import 'package:flutter_widgets/dart/change_notifier_demo.dart';
import 'package:flutter_widgets/widgets/animation/animated_widget_page.dart';
import 'package:flutter_widgets/widgets/animation/animation_page.dart';
import 'package:flutter_widgets/widgets/animation/tween_animation_builder_page.dart';
import 'package:flutter_widgets/widgets/custom_paint/custom_paint.dart';
import 'package:flutter_widgets/widgets/custom_paint/custom_painter_example.dart';
import 'package:flutter_widgets/widgets/custom_paint/schedule_painter.dart';
import 'package:flutter_widgets/widgets/dropdown_textfield.dart';
import 'package:flutter_widgets/widgets/easy_loading_page.dart';
import 'package:flutter_widgets/widgets/event_bus_page.dart';
import 'package:flutter_widgets/widgets/future_page.dart';
import 'package:flutter_widgets/widgets/hero_page.dart';
import 'package:flutter_widgets/widgets/isolate_page.dart';
import 'package:flutter_widgets/widgets/life_cycle.dart';
import 'package:flutter_widgets/widgets/listener_page.dart';
import 'package:flutter_widgets/local_storage/local_storage_page.dart';
import 'package:flutter_widgets/method_channel/method_channel_page.dart';
import 'package:flutter_widgets/network.dart';
import 'package:flutter_widgets/widgets/lock.dart';
import 'package:flutter_widgets/widgets/notification.dart';
import 'package:flutter_widgets/widgets/platform_view_page.dart';
import 'package:flutter_widgets/state_manager/state_manager_page.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:flutter_widgets/widgets/route_observer_page.dart';
import 'package:flutter_widgets/widgets/route_page.dart';
import 'package:flutter_widgets/widgets/scroll_view_page.dart';
import 'package:flutter_widgets/widgets/signature_util.dart';
import 'package:flutter_widgets/widgets/sliver.dart';
import 'package:flutter_widgets/widgets/stream_builder_page.dart';
import 'package:flutter_widgets/widgets/stream_page.dart';
import 'package:flutter_widgets/widgets/tabbar_page.dart';
import 'package:flutter_widgets/widgets/touch_page.dart';
import 'package:flutter_widgets/widgets/webview_page.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());

  // This captures errors reported by the Flutter framework.
  // FlutterError.onError = (FlutterErrorDetails details) async {
  //   Zone.current.handleUncaughtError(details.exception, details.stack!);
  // };

  // ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
  //   print(flutterErrorDetails.toString());
  //   return const Scaffold(
  //       body: Center(
  //     child: Text("页面加载出错~"),
  //   ));
  // };

  // runZonedGuarded(() {
  //
  //   // Person full = Person().f
  // }, (error, stackTrace) async {
  //   await _reportError(error, stackTrace);
  // });
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  logUtil('Caught error: $error');
  logUtil('Reporting to Bugly...');
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {




    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      //注册路由
      routes: {
        "/route_next": (context) => const RouteNextPage(),
        "/r1": (context) => const Route1Page(),
      },
      getPages: [
        GetPage(name: "/r1", page: ()=> const Route1Page()),
        GetPage(name: "/r2", page: ()=> const Route1Page()),
        GetPage(name: "/r3", page: ()=> const Route1Page()),
        GetPage(name: "/home", page: ()=> const MyHomePage(title: "",)),
      ],
      navigatorObservers: [routeObserver],
      /// 错误路由处理，统一返回UnknownPage
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

class _MyHomePageState extends State<MyHomePage> with RouteAware {
  final List<Widget> _data = [];

  @override
  void initState() {
    super.initState();

    List<WidgetBean> list = [

      WidgetBean(title: "Lifecycle", page: const LifeCyclePage()),
      WidgetBean(title: "Sliver", page: const SliverPage()),
      WidgetBean(title: "CustomPaint", page: const CustomPaintPage()),
      WidgetBean(title: "Lock", page: const LockPage()),
      WidgetBean(title: "SchedulePainter", page: SchedulePainter(itemWidth: 24, startTime: DateTime.now(), endTime: DateTime.now().add(const Duration(days: 10)),)),
      WidgetBean(title: "Listener", page: const ListenerPage()),
      WidgetBean(title: "GestureDetector", page: const GestureDetectorPage()),
      WidgetBean(title: "RawGestureDetector", page: const RawGestureDetector()),
      WidgetBean(title: "InheritedWidget", page: const InheritedPage()),
      WidgetBean(title: "Notification", page: const NotificationPage()),
      WidgetBean(title: "EventBus", page: const EventBusPage()),
      WidgetBean(title: "ChangeNotifier", page: const ChangeNotifierDemoPage()),
      WidgetBean(title: "Route", page: const RoutePage()),
      WidgetBean(title: "Animation", page: const AnimationPage()),
      WidgetBean(title: "AnimatedWidget", page: const AnimatedWidgetPage()),
      WidgetBean(title: "AnimatedBuilder", page: const AnimatedBuilderPage()),
      WidgetBean(title: "TweenAnimationBuilder", page: const TweenAnimationBuilderPage()),
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
      WidgetBean(title: "Signature", page: const SignaturePage()),
      WidgetBean(title: "Tabs", page: const TabsPage()),
      WidgetBean(title: "ScrollView", page: const ScrollViewPage()),
      WidgetBean(title: "RouteObserver", page:  const RouteObserverPage(color: Colors.red,)),
      WidgetBean(title: "TabBarPage", page: const TabbarPage()),
      WidgetBean(title: "Route1", page: const Route1Page()),
      WidgetBean(title: "EasyLoading", page: const EasyLoadingPage()),
      WidgetBean(title: "Webview", page: const WebviewPage()),

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
