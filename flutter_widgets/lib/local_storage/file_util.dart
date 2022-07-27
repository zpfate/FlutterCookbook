
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../tools/log_util.dart';

class FileUtil {

  /// 创建文件目录
 static Future<File> makeLocalFile({String fileName  = "placeholder"}) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    logUtil("documentPath = $path");
    return File('$path/$fileName');
  }

 /// 写入
 static Future<File> write({required String content, String fileName = "placeholder"}) async {
   final file = await makeLocalFile(fileName: fileName);
   file.writeAsString(content);
   return file;
 }



 /// 读取
 static Future<String> readContent({String fileName  = "placeholder"}) async {
   try {
     final file = await makeLocalFile(fileName: fileName);
     String contents = await file.readAsString();
     logUtil("read success, string = $contents");
     return contents;
   } catch (e) {
     return "read failed";
   }
 }
}