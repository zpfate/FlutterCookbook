

import 'package:flutter/material.dart';

class ComponentUI extends StatelessWidget {
  ComponentUI ({super.key});
  String account = '';
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        submitBtnClick();
      },
      child: const Text('Submit',),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(top: 2, bottom: 0, left: 16, right: 0),
        backgroundColor: Color(0xFF7033FF),
        foregroundColor: Color(0xFFFFFFFF),
        side: const BorderSide(color: Color(0x00000033), width: 1),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
  void submitBtnClick() {
    account = 'set account new value';
  }

}