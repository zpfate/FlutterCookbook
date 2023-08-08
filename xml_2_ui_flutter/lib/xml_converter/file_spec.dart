
import 'package:xml_2_ui/xml_converter/class_spec.dart';
import 'package:xml_2_ui/xml_converter/spec.dart';
import 'package:xml_2_ui/xml_converter/variable_spec.dart';
import 'package:xml_2_ui/xml_converter/widget_spec.dart';
import 'func_spec.dart';

class FileSpec implements Spec {

  late ClassSpec classSpec;
  late WidgetSpec widget;
  List<VariableSpec>? variables;
  List<FuncSpec>? functions;

  FileSpec();
  FileSpec.build({
    required this.classSpec,
    required this.widget,
    this.variables,
    this.functions,
  });

  @override
  String code() {
    String fileText = classSpec.code();
    if (variables != null) {
      fileText = fileText.replaceAll("%fieldList", variables!.map((e) => e.code()).toList().join());
    } else {
      fileText = fileText.replaceAll("%fieldList", "\n");
    }
    fileText = fileText.replaceAll("%child", widget.code());
    return "";
  }

  @override
  Spec create({Params? args}) {
    throw UnimplementedError();
  }

}