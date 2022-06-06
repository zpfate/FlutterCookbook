
import 'package:flutter/services.dart';
import 'package:flutter_widgets/tools/log_util.dart';

class MethodChannelUtil {
  static const methodChannel =  MethodChannel(
      "samples.zpfate/utils");
  static openAppMarket() async {
    int result;
    try {
      result = await methodChannel.invokeMethod('openAppMarket');
    } catch (e) {
      result = 1;
    }
    logUtil(message: "Result: $result");
  }

  static const basicMethodChannel = BasicMessageChannel("samples.zpfate/utils", StandardMessageCodec());
  static openAppMarket2() async {
    dynamic result;
    try {
      result = await basicMethodChannel.send('openAppMarket');
    } catch (e) {
      result = 1;
    }
    logUtil(message: "Result: $result");
  }




}