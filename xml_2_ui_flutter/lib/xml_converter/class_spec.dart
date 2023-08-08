import 'package:xml_2_ui/xml_converter/spec.dart';

enum ClassType {
  normal,
  stateless,
  stateful,
  abstract,
}

class ClassSpec implements Spec {
  final String className;
  final ClassType classType;

  ClassSpec.build(
      {required this.className, this.classType = ClassType.stateless});

  @override
  String code() {
    // TODO: implement code
    String clsText = '''
    class $className extends StatelessWidget {\n
    $className ({super.key});\n
    %fieldList\n
    @override\n
    Widget build(BuildContext context) {\n
    return %child;\n
    }\n
    %methodList\n
    }''';
    return clsText;
  }
}
