import 'package:flutter/material.dart';

class TextfiledPage extends StatefulWidget {
  const TextfiledPage({super.key});

  @override
  State<TextfiledPage> createState() => _TextfiledPageState();
}

class _TextfiledPageState extends State<TextfiledPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
      ),
      body: const Center(
        child: TextSelectionTheme(
          data: TextSelectionThemeData(
            selectionHandleColor: Colors.yellow,
            selectionColor: Colors.green,
            cursorColor: Colors.red,
          ),
          child: TextField(
            cursorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
