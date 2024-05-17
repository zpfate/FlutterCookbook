

import 'package:flutter/cupertino.dart';

class PinYinTextEditingController extends TextEditingController {
  String completedText = "";

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    // TODO: implement buildTextSpan

    if (!value.composing.isValid || !withComposing) {
      if (completedText != value.text) {
        completedText = value.text;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          notifyListeners();
        });
      }
    }

    final bool composingRegionOutOfRange = !value.isComposingRangeValid || !withComposing;
    if (composingRegionOutOfRange) {
      return TextSpan(style: style, text: text);
    }

    /// 输入拼音的时候但是还没有确认输入的时候
    /// 类似于iOS原生TextField的markedRange的效果
    /// 重写此方法可以修改markedRange的效果
    final TextStyle composingStyle = style?.merge(const TextStyle(decoration: TextDecoration.none))
        ?? const TextStyle(decoration: TextDecoration.none);

    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(text: value.composing.textBefore(value.text)),
        TextSpan(
          style: composingStyle,
          text: value.composing.textInside(value.text),
        ),
        TextSpan(text: value.composing.textAfter(value.text)),
      ],
    );
  }
}