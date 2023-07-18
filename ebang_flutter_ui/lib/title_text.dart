import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final Axis? axis;
  final String? title;
  final String? content;
  final double? verticalMargin;

  const TitleText({Key? key, this.axis = Axis.horizontal, this.verticalMargin,this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis!,
      mainAxisAlignment: axis == Axis.vertical ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        Text(title ?? ""),
        if (axis == Axis.vertical && verticalMargin != null) SizedBox(height: verticalMargin!,),
        Text(content ?? ""),
      ],
    );
  }
}
