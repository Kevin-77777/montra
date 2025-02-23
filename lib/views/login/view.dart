import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:montra/states/index.dart';
import 'package:montra/views/login/controller.dart';
import 'package:montra/views/login/widgets/guide.dart';
import 'package:montra/views/login/widgets/login.dart';

class Login extends StatefulWidget {
  static String path = "/login";
  static String name = "login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController get controller => appState.get<LoginController>();
  Size get screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    appState.register(LoginController());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: const [
        Guide(),
        LoginPage(),
      ],
    );
  }
}
