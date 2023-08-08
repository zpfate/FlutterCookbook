

class DartPoet {

  static String result = "";
  static importPackage({String? packageName}) {
    result += "import 'package:flutter/material.dart';\n\n";
  }

  static createClass(String name) {
   String clsText = '''
    class $name extends StatelessWidget {\n
    $name ({super.key});\n
    %fieldList\n
    @override\n
    Widget build(BuildContext context) {\n
    return %child;\n
    }\n
    %methodList\n
    }''';
   result += clsText;
  }

  static addWidget() {

  }

}