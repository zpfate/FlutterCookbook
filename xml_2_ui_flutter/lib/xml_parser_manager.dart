

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:xml/xml.dart';

class XMLParserManager  {

  static Future<XmlDocument> parseXML(String filePath) async {
    String xmlString = await rootBundle.loadString(filePath);
    final document = XmlDocument.parse(xmlString);
    return document;
  }
}
