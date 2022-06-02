import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/TFAppBar.dart';
import 'package:flutter_widgets/tools/log_util.dart';
import 'package:flutter_widgets/tools/widget_bean.dart';
import 'package:http/http.dart' as http;

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Network"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClickWidget(
                widgetBean: WidgetBean(title: "HttpClient GET", onPressed: () {
                  _httpClientGet();
                })),
            ClickWidget(
                widgetBean: WidgetBean(title: "Http GET", onPressed: () {
                  _httpGet();
                })),
            ClickWidget(widgetBean: WidgetBean(title: "Dio GET", onPressed: () {
              _dioGet();
            })),

            ClickWidget(widgetBean: WidgetBean(title: "Dio 上传", onPressed: () {
                _dioUpload();
            })),
          ],
        ),
      ),
    );
  }


  /// HttpCilent get请求
  _httpClientGet() async {
    var httpClient = HttpClient();
    httpClient.idleTimeout = const Duration(seconds: 5);
    /// 构造URI 设置user-agent为'Custom-UA'
    var uri = Uri.parse("https://flutter.dev");
    var request = await httpClient.getUrl(uri);
    // request.headers.add("user-agent", 'Custom-UA');
    /// 发起请求 等待响应
    var response = await request.close();

    /// 收到响应 处理结果
    if (response.statusCode == HttpStatus.ok) {
      logUtil(message: await response.transform(utf8.decoder).join());
    } else {
      logUtil(message: 'Error: \nHttp status ${response.statusCode}');
    }
  }

  _httpGet() async {
    /// 创建网络调用示例

    var url = Uri.parse("");
    var response = await http.get(url,headers: {"user-agent" : "Custom-UA"});
    if (response.statusCode == HttpStatus.ok) {
      logUtil(message: response.body);
    } else {
      logUtil(message: response.body);
    }
  }

  /// dio get
  _dioGet() async {
    var response = await Dio().get("https://flutter.dev", options: Options(headers: {"user-agent" : "Custom-UA"}));
    if (response.statusCode == HttpStatus.ok) {
      logUtil(message: response.data);
    } else {
      logUtil(message: "Error: ${response.statusCode}");
    }
  }

  _dioUpload() async {
    //使用FormData表单构建待上传文件
    FormData formData = FormData.fromMap(
        {
          // "file1": UploadFileInfo(File("./file1.txt"), "file1.txt"),
          // "file2": UploadFileInfo(File("./file2.txt"), "file1.txt"),
        }
    );

    Dio dio = Dio();
    // 通过post方法发送至服务端
    var responseY = await dio.post("https://xxx.com/upload", data: formData);print(responseY.toString());
    // 使用download方法下载文件
    dio.download("https://xxx.com/file1", "xx1.zip");
    // 增加下载进度回调函数
    dio.download("https://xxx.com/file1", "xx2.zip", onReceiveProgress: (count, total) {
      //do something
    });
  }

  /// 同时发起两个请求
  _bothAsyncRequest() async {
    Dio dio = Dio();

    // 同时发起两个并行请求
    List<Response> responseX= await Future.wait(
        [
          dio.get("https://flutter.dev"),
          dio.get("https://pub.dev/packages/dio")
        ]);
    // 打印请求1响应结果
    debugPrint("Response1: ${responseX[0].toString()}");
    // 打印请求2响应结果
    debugPrint("Response2: ${responseX[1].toString()}");
  }
}
