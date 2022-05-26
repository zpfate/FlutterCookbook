

import 'package:flutter/widgets.dart';

void logUtil({String? message}) {

  StackTrace current = StackTrace.current;
  var traceString = current.toString().split("\n")[1];
  List<String> components = traceString.split(".");
  String className = components[0];
  className = className.split("_")[1];
  var functionName = components[1].split("(")[0];
  debugPrint("[$className] $functionName ${message ?? ""}");





  // var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
  // var fileInfo = traceString.substring(indexOfFileName);
  // var listOfInfos = fileInfo.split(":");
  // var fileName = listOfInfos[0];
  // var lineNumber = int.parse(listOfInfos[1]);
  // var columnStr = listOfInfos[2];
  // columnStr = columnStr.replaceFirst(")", "");
  // var columnNumber = int.parse(columnStr);

}