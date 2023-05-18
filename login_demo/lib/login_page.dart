import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/login_logic.dart';
import 'package:login_demo/privacy_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginLogic _logic = Get.put(LoginLogic());
  bool hidden = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeText(),
              const SizedBox(
                height: 20,
              ),
              _buildInputWidget("手机号", _logic.phoneController),
              const SizedBox(
                height: 20,
              ),
              _buildInputWidget("密码", _logic.pwdController),
              const SizedBox(
                height: 20,
              ),
              _privacyWidget(),
              const SizedBox(
                height: 20,
              ),
              _loginBtn(),
            ],
          ),
        ),
      ),
    );
  }

  /// 欢迎文本
  Widget _welcomeText() {
    return const Text(
      "您好,欢迎登录!",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInputWidget(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  /// 服务协议
  Widget _privacyWidget() {
    return Row(
      children: [
        GetBuilder<LoginLogic>(
          id: 12,
          builder: (logic) {
            return SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  value: _logic.checked,
                  onChanged: (value) {
                    logic.changeStatus();
                  }),
            );
          },
        ),
        const Text("同意"),
        GestureDetector(
          onTap: () {
            print("点击了服务协议");
            Get.to(()=> const PrivacyPage());
          },
          child: const Text(
            "<服务协议>",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
        const Text("和"),
        const Text(
          "<隐私协议>",
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ],
    );
  }

  Widget _loginBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: () {
        _logic.login();
        log("---$hidden");
      }, child: const Text("登录")),
    );
  }
}
