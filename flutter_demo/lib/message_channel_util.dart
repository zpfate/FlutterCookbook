import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

class MessageChannelUtil {
  // 单例公开访问点
  factory MessageChannelUtil() => _sharedInstance();
  factory MessageChannelUtil.init() => _sharedInstance();
  // 静态私有成员，提前初始化
  static final MessageChannelUtil _instance = MessageChannelUtil._();
  // 私有构造函数
  MessageChannelUtil._() {
    // 具体初始化代码
    _init();
  }
  // 静态、同步、私有访问点
  static MessageChannelUtil _sharedInstance() {
    return _instance;
  }

  /// 初始化
  static _init() {
    _messageChannel.setMessageHandler((message) async {
      log("✉️✉️✉️✉️✉️ ✉️✉️✉️✉️✉️ dart端接收到native通信:$message");
      Parameters response = Parameters.from(json.decode(message));
      InteractMethod method = InteractMethodToString.init(response["method"]);
      Parameters? params = response["params"];

      /// 根据接收到的方法名称做分别处理
      switch (method) {
        case InteractMethod.init:
          break;
        /// 配置
        case InteractMethod.config:
          // BuildConfig.config(params);
          break;
        case InteractMethod.openPage:
          /// 打开新的页面
          // BuildConfig.config(params);
          // AppRoutes.openPage(params);
          break;
      }
      return {"result": true}.toString();
    });
  }

  /// 初始化与原生通信的通道
  static const BasicMessageChannel _messageChannel =
      BasicMessageChannel("com.ebglobal.flutter.channel", StringCodec());

  /// 打开原生页面
  static Future<InteractResult> openPage(String pageName) async {
    InteractResult interactResult = await invokeMethod(InteractMethod.openPage,
        params: {"pageName": pageName});
    return interactResult;
  }

  /// 调用原生方法
  static Future<InteractResult> invokeMethod(InteractMethod method,
      {Parameters? params}) async {
    Parameters parameters = {"method": method.name(), "params": params ?? {}};
    InteractResult interactResult = await sendMessage(parameters);
    return interactResult;
  }

  /// 发送
  static Future<InteractResult> sendMessage(Parameters parameters) async {
    String? result = await _messageChannel.send(parameters.toString());
    if (result != null) {
      Parameters response = Parameters.from(json.decode(result));
      return InteractResult.fromJson(response);
    }
    return InteractResult(success: false);
  }
}
typedef Parameters = Map<String, dynamic>;

class InteractResult {
  bool? success;
  Parameters? params;
  InteractResult({this.success = true, this.params});

  InteractResult.fromJson(dynamic json) {
    success = json["result"] ?? false;
    params = json["params"];
  }
}

enum InteractMethod {
  none,
  init,
  /// 登录
  login,
  /// 初始化
  config,
  /// 配置参数传输
  response,
  /// 通信后Native端应答
  quitLogin,
  /// 退出登录
  openPage,
  /// 打开页面
  addPayment,
  transfer,
}

extension InteractMethodToString on InteractMethod {
  String name() {
    return toString().split('.').last;
  }

  static init(String? method) {
    for (var e in InteractMethod.values) {
      if (e.name() == method) {
        return e;
      }
    }
    return InteractMethod.none;
  }
}
