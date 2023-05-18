import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController userController = TextEditingController();
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              buildTopWidget(),
              const SizedBox(
                height: 20,
              ),
              buildAccountInputWidget(userController, "手机号"),

              const SizedBox(
                height: 20,
              ),

              buildAccountInputWidget(userController, "密码"),

              const SizedBox(
                height: 20,
              ),
              privacyWidget(),

              const SizedBox(
                height: 20,
              ),
              _buildLoginButton(),
            ]

        ),
      ),
    );
  }

  Widget buildTopWidget() {
    return const Text(
      '您好，欢迎登录',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
    );
  }


  Widget buildAccountInputWidget(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: const TextStyle(fontSize: 16),
      keyboardType: TextInputType.phone,
    );
  }

  Widget privacyWidget() {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value ?? false;
              });
            }),
       const Text(
          '同意',
          style: TextStyle(fontSize: 14),
        ),
        const Text(
          '<服务协议>',
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        const Text(
          '和',
          style: TextStyle(fontSize: 14),
        ),
        const Text('<隐私政策>', style: TextStyle(fontSize: 14, color: Colors.blue)),
      ],
    );
  }

  Widget _buildLoginButton() {
    return  SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        onPressed: () {
          /// 去登录

        },
        child: const Text("登录"),
      ),
    );
  }

}
