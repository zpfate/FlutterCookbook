

import 'package:xml_2_ui/xml_converter/parameter_spec.dart';
import 'package:xml_2_ui/xml_converter/spec.dart';

class FuncSpec implements Spec {

  final String funcName;
  final List<ParameterSpec>? parameters;
  FuncSpec.build({required this.funcName, this.parameters});

  @override
  String code() {
    // TODO: implement code
    return "";
  }

  @override
  Spec create({Params? args}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}