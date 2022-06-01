
import 'package:flutter/material.dart';

class WidgetBean {

  final String title;
  final Widget? page;
  final Function()? onPressed;
  WidgetBean({required this.title, this.page, this.onPressed});
}