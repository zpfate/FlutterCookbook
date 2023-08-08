
import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:xml_2_ui/xml_converter/xml_converter.dart';
import 'package:xml_2_ui/xml_parser_manager.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  @override
  void initState() {
    // TODO: implement initState
    parseXML();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("XmlToFlutterConverter"),),
      body: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 200,
              decoration: InputDecoration(
                hintText: "Please enter the xml.xml code",
              ),
            ),
          ),

          Expanded(
            child: TextField(
              maxLines: 200,
              decoration: InputDecoration(
                hintText: "Flutter result code output here",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void parseXML() async {
    XmlDocument xmlDocument = await XMLParserManager.parseXML('assets/xml.xml');
    XMLConverter.convertXML(xmlDocument);
  }

}
