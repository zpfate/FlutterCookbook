
import 'package:xml_2_ui/xml_converter/spec.dart';

class ParameterSpec implements Spec {
  final String type;
  final String name;
  ParameterSpec.build({required this.type, required this.name});

  @override
  String code() {
    // TODO: implement code
    return "$type $name";
  }

  @override
  Spec create({Params? args}) {
    // TODO: implement create
    throw UnimplementedError();
  }
}