
import 'package:xml_2_ui/xml_converter/spec.dart';

enum DependencyMode {
  import,
  export,
  part,
  partOf,
}

class DependencySpec implements Spec {

  final String packageName;
  final DependencyMode mode;
  DependencySpec.build({required this.packageName, this.mode = DependencyMode.import});
  @override
  String code() {
    // TODO: implement code
    String raw = '';
    switch (mode) {
      case DependencyMode.import:
        raw += "import '$packageName';";
        break;
      case DependencyMode.export:
        raw += "export '$packageName';";
        break;
      case DependencyMode.part:
        raw += "part '$packageName';";
        break;
      case DependencyMode.partOf:
        raw += "part of '$packageName";
        break;
    }
    return raw;
  }



}