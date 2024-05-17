

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

class EasyLoadingPage extends StatelessWidget {
  const EasyLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "EasyLoading Demo"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _clickWidget("普通loading", _showLoading),
          _clickWidget("toast", _showToast)

        ],
      ),
    );
  }

  Widget _clickWidget(String text, Function() onClick) {
    return ElevatedButton(onPressed: onClick, child: Text(text));
  }


  void _showToast() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 8.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    EasyLoading.showToast("status",);
  }

  void _showLoading() {
    EasyLoading.show(indicator: const CircularProgressIndicator(
        color: Colors.blue, strokeWidth: 3), );

    Future.delayed(const Duration(seconds: 3), () {
      EasyLoading.dismiss();
    });
  }
}
