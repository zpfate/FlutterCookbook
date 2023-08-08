import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';
import 'package:xml_2_ui/xml_converter/file_spec.dart';
import 'package:xml_2_ui/xml_converter/spec.dart';
import 'package:xml_2_ui/xml_converter/variable_spec.dart';

class XMLConverter {

  static const String kFieldListElementName = "FieldList";
  static const String kMethodListElementName = "MethodList";
  static const String kUIElementName = "UI";
  static const String kMethodElementName = "Method";


  FileSpec fileSpec = FileSpec();
  static convertXML(XmlDocument xmlDocument) {
    var rootElement = xmlDocument.rootElement;
    for (var child in rootElement.childElements) {
      handleXMLElement(child);
    }
  }

  static handleXMLElement(XmlElement element) {
    switch (element.name.local) {
      case kFieldListElementName: {

      }
      break;
      case kMethodListElementName: {

      }
      break;
    }
  }

  static handleVariableList(XmlElement element) {
    List<Spec> variables = [];
    for (var child in element.childElements) {
      // variables.add(VariableSpec.create());
    }
  }
}
