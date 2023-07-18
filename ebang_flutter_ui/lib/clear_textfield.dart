
import 'dart:async';

import 'package:flutter/material.dart';

class ClearTextField extends StatefulWidget {

  /// 最大长度
  final int? maxLength;
  /// 占位文本
  final String? hintText;
  /// 占位文本UI
  final TextStyle? hintStyle;
  /// 文本控制器
  final TextEditingController? textEditingController;
  /// 输入框焦点
  final FocusNode? focusNode;
  /// 是否自动获取焦点
  final bool autoFocus;
  /// 是否显示密文
  final bool obscureText;
  /// 副图标
  final String? suffixIconName;
  /// 键盘类型
  final TextInputType? keyboardType;

  const ClearTextField({Key? key,
    this.maxLength,
    this.hintText,
    this.hintStyle,
    this.textEditingController,
    this.focusNode,
    this.autoFocus = false,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIconName}) : super(key: key);

  @override
  State<ClearTextField> createState() => _ClearTextFieldState();
}

class _ClearTextFieldState extends State<ClearTextField> {

  StreamController? _streamController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: _suffixIcon(),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        )
      ),
    );
  }

  /// 副图标
  Widget _suffixIcon() {
    return Container();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_streamController != null) {
      _streamController!.close();
    }
  }

}
