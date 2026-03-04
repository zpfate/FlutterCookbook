import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BasicMessageUtil {
  
  static const messageChannel =
  const BasicMessageChannel("com.nativeflutterdemo.www", StandardMessageCodec());

  static initMessageChannel() {
    messageChannel.setMessageHandler((message) async {

      /// 监听到原生发送的flutter端
      print("$message");
    });
  }

  static dynamic sendMessage(dynamic message) async {
    dynamic res = await messageChannel.send(message);
    print(res);
    return res;
  }


}