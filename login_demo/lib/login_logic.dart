

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {
  bool checked = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void changeStatus() {
    checked = !checked;
    update([23]);
  }

  void login() async {
    if (!checked) {
      log("没有同意协议");
      return;
    }
    String phone = phoneController.text;
    String pwd = pwdController.text;
    log("phone = $phone, pwd = $pwd");
    var params = {"phone": phone, "pwd": pwd};
    final dio = Dio();
    final response = await dio.get('https://pub.dev', data: params);
    print(response.data);
  }
}