import 'package:xml_2_ui/xml_converter/spec.dart';

class WidgetSpec implements Spec {
  final String widgetName;
  WidgetSpec.build({required this.widgetName});

  @override
  String code() {
    // TODO: implement code
    String clsText = '''
    class $widgetName extends StatelessWidget {\n
    $widgetName ({super.key});\n
    %fieldList\n
    @override\n
    Widget build(BuildContext context) {\n
    return %child;\n
    }\n
    %methodList\n
    }''';
    return "";
  }
}
