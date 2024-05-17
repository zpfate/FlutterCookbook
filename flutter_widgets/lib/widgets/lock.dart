

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "LockPage"),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
                MySingleton.increase();
            },
          ),

          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
                MySingleton.decrease();
            },
          ),
        ],
      ),
    );
  }
}


class MySingleton {
  // 创建一个私有的静态变量来存储单例实例
  static MySingleton? _instance;

  // 私有构造函数，防止外部实例化
  MySingleton._();

  int value = 0;

  Lock lock = Lock();


  static increase() async {
    MySingleton.getInstance().lock.lock();
   Future.delayed(const Duration(seconds: 2), (){
     MySingleton._instance!.value++;
     debugPrint("MySingleton._instance!.value===${MySingleton._instance!.value}");
   });
   _instance!.lock.unlock();
  }

  static decrease() {
    MySingleton.getInstance().lock.lock();
    Future.delayed(const Duration(seconds: 2), (){
      MySingleton._instance!.value--;
      debugPrint("MySingleton._instance!.value===${MySingleton._instance!.value}");
    });

    _instance!.lock.unlock();
  }


  // 公开的静态方法，用于获取单例实例
  static MySingleton getInstance() {
    // 如果单例实例不存在，则创建一个新的实例
    _instance ??= MySingleton._();
    return _instance!;
  }

  // 在这里添加你的其他方法和属性
  void doSomething() {
    print('Doing something...');
  }
}