
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_widgets/method_channel/method_channel_util.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebviewPage extends StatefulWidget {

  const WebviewPage({super.key});
  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {

  final WebViewController _controller = WebViewController();
  
  @override
  void initState()  {
    // TODO: implement initState

    _initFont();
    super.initState();
  }

  void _initFont() async {

    Dio dio = Dio();
    Response response = await dio.get("http://localhost:8080/index.html");
    if (response.statusCode == 200) {

    }
    String path = await MethodChannelUtil.getBundlePath();
    _controller.setNavigationDelegate(
        NavigationDelegate(onPageFinished: (url) {
          // _insertFontJS();
        }));
    WebKitWebViewController controller =
    _controller.platform as WebKitWebViewController;
    controller.setInspectable(true);
    _controller.loadHtmlString(response.data, baseUrl: path);

  }

  @override
  Widget build(BuildContext context) {
    // return Image.asset("name");

    return Scaffold(
      appBar: defaultAppBar(title: "Webview"),
      resizeToAvoidBottomInset: true,
      body: WebViewWidget(
        controller: _controller,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );
  }

  void _insertFontJS() {
    String js = '''
    @font-face {
    font-family: "HM-Bold";
    src: url("assets/fonts/HarmonyOS_Sans_SC_Bold.ttf") format("truetype");
    }
    ''';
    _controller.runJavaScript(js);
  }
}
