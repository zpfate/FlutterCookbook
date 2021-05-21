import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class RequestResponse {

  final BuildContext context;
  /// 网络请求结果
  final bool isSuccess;
  /// 返回数据主体
  dynamic data;
  /// 状态码
  int code;
  /// 错误信息
  String errorMsg;

  RequestResponse(this.context, {@required this.isSuccess, this.data, this.code, this.errorMsg})

}