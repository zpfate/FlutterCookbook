
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

  /// BinaryCodec:是最为简单的一种Codec，因为其返回值类型和入参的类型相同，均为二进制格式（Android中为ByteBuffer，iOS中为NSData）。
  /// 实际上，BinaryCodec在编解码过程中什么都没做，只是原封不动将二进制数据消息返回而已
  ///
  /// StringCodec:用于字符串与二进制数据之间的编解码，其编码格式为UTF-8。
  ///
  /// JSONMessageCodec:用于基础数据与二进制数据之间的编解码，其支持基础数据类型以及列表、字典。
  /// 其在iOS端使用了NSJSONSerialization作为序列化的工具，而在Android端则使用了其自定义的JSONUtil与StringCodec作为序列化工具。
  ///
  /// StandardMessageCodec:是BasicMessageChannel的默认编解码器，其支持基础数据类型、二进制数据、列表、字典
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