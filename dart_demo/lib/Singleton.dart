import 'package:flutter/material.dart';

class Singleton {

  /// 单例对象
  static Singleton _singleton;

  /// 内部构造方法,可避免外部暴露
  Singleton._internal();

  /// 工厂构造方法
  factory Singleton.getInstance() => _getInstance();

  static _getInstance() {
    /// 只能有一个实例
    if (_singleton == null) {
      _singleton = Singleton._internal();
    }
    return _singleton;
  }
  
}