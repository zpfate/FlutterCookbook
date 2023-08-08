import 'package:xml_2_ui/xml_converter/spec.dart';

class VariableSpec implements Spec {

  final String name;
  final String type;
  final String? value;
  VariableSpec.build({required this.name, required this.type, this.value});



  @override
  String code() {
    // TODO: implement code
    if (value != null) {
      return "$type $name = $value;\n";
    }
    return "$type? $name;\n";
  }

  // @override
  // Spec create({Params? args}) {
  //   // TODO: implement create
  //   String? name = args?["name"];
  //   String? type = args!["type"];
  //   String? value = args!["value"];
  //   assert(name == null || type == null);
  //   return VariableSpec.build(name: name!, type: type!, value: value);
  // }
}
