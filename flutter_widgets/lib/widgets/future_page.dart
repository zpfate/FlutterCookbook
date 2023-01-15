import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class FuturePage extends StatelessWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
    Future 异步任务的执行是相对简单的：在我们声明一个 Future 时，
    Dart 会将异步任务的函数执行体放入事件队列，然后立即返回，
    后续的代码继续同步执行。而当同步执行的代码执行完毕后，
    事件队列会按照加入事件队列的顺序（即声明顺序），依次取出事件，
    最后同步执行 Future 的函数体及后续的 then。

    then 与 Future 函数体共用一个事件循环。而如果 Future 有多个 then，
    它们也会按照链式调用的先后顺序同步执行，同样也会共用一个事件循环。
     */




    return Scaffold(
      appBar: defaultAppBar(title: "Future"),
    );

  }


  _test1() {
    // 上一个事件循环结束后，连续输出三段字符串
    Future(() => debugPrint('Running in Future 1'));
    Future(() => debugPrint('Running in Future 2'))
        .then((_) => debugPrint('and then 1'))
        .then((_) => debugPrint('and then 2'));
  }

  _test2() {
    // f1比f2先执行
    Future(() => debugPrint('f1'));
    Future(() => debugPrint('f2'));
    // f3执行后会立刻同步执行then 3
    Future(() => debugPrint('f3')).then((_) => debugPrint('then 3'));
    // then 4会加入微任务队列，尽快执行
    Future(() => null).then((_) => debugPrint('then 4'));
  }

  _test3() {
    Future(() => debugPrint('f1'));//声明一个匿名Future
    Future fx = Future(() =>  null);//声明Future fx，其执行体为null
    //声明一个匿名Future，并注册了两个then。在第一个then回调里启动了一个微任务
    Future(() => debugPrint('f2')).then((_) {
      debugPrint('f3');
      scheduleMicrotask(() => debugPrint('f4'));
    }).then((_) => debugPrint('f5'));
    //声明了一个匿名Future，并注册了两个then。第一个then是一个Future
    Future(() => debugPrint('f6'))
        .then((_) => Future(() => debugPrint('f7')))
        .then((_) => debugPrint('f8'));
    //声明了一个匿名Future
    Future(() => debugPrint('f9'));
    //往执行体为null的fx注册了了一个then
    fx.then((_) => debugPrint('f10'));
    //启动一个微任务
    scheduleMicrotask(() => debugPrint('f11'));
    debugPrint('f12');
  }



  Future<String> _fetchContent() =>
      Future<String>.delayed(const Duration(seconds: 2), ()=>"Hello")
          .then((value) => "$value 2022");

}
