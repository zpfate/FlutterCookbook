import 'package:flutter/material.dart';

extension FullText on TextEditingController {

  void setFullText(
      String? text, {
        int? offset,
      }) {
    if (offset != null) {
      assert(offset <= (text?.length ?? 0));
    }
    value = value.copyWith(
      text: text,
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: offset ?? text?.length ?? 0,
        ),
      ),
    );
  }
}

extension AsFixed on String {

  String toStringAsFixed({int fractionDigits = 2}) {
    if (isEmpty) return "";
    num value = num.parse(this);
    return value.toStringAsFixed(fractionDigits);
  }
}
