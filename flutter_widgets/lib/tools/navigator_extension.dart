import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 动态路由方法封装
/// [context]当前页面的Context
/// [routeName]目标页面的路由名称
/// [parameters]向目标当前页面传的参数
/// [callback]目标页面关闭事的回调函数
void push(BuildContext context, Widget page,
    {String? routeName,
      parameters,
      bool isReplace = false,
      Function? callback}) {
  PageRoute pageRoute;
  if (Platform.isIOS) {
    /// iOS平台使用支持滑动关闭页面的路由控制
    pageRoute = CupertinoPageRoute(
        builder: (context) {
          return page;
        },
        settings: RouteSettings(name: routeName, arguments: parameters));
  } else {
    /// Android平台使用Material风格控制
    pageRoute = MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: RouteSettings(name: routeName, arguments: parameters));
  }
  if (isReplace) {
    Navigator.of(context).pushReplacement(pageRoute).then((value) => {
      if (callback != null) {callback(value)}
    });
  } else {
    Navigator.of(context).push(pageRoute).then((value) => {
      if (callback != null) {callback(value)}
    });
  }
}

void pop(BuildContext context, {parameters}) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop(parameters);
  }
}