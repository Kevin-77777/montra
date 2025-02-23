import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:montra/components/button/primary.dart';
import 'package:montra/states/index.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/login/controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController get controller => appState.get<LoginController>();
  PreferredSizeWidget get appbar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: controller.pushToGuidePage,
            child: Image.asset(
              "assets/images/arrow-left.png",
              width: 32,
            ),
          ),
        ),
        title: Text(
          Utils.i18n(context, "login.login"),
          style: theme.font.title3.copyWith(color: theme.color.dark50),
        ),
      ),
    );
  }

  Widget get email {
    return TextField(
      decoration: InputDecoration(
        labelText: Utils.i18n(context, "login.email"),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget get password {
    return Observer(
      builder: (context) {
        return TextField(
          obscureText: controller.obscurePassword,
          controller: controller.passwordController,
          decoration: InputDecoration(
            labelText: Utils.i18n(context, "login.password"),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: controller.showPassword.call,
                child: Image.asset(
                  "assets/images/show.png",
                  width: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get loginButton {
    return MontraButton.primary(
      text: Utils.i18n(context, "login.login"),
    );
  }

  Widget get forgetPassword {
    return Text(
      Utils.i18n(context, "login.forgetPassword"),
      style: theme.font.title3.copyWith(color: theme.color.violet100),
    );
  }

  Widget get signUp {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: Utils.i18n(context, "login.dontHaveAccount"),
            style: theme.font.body1.copyWith(color: theme.color.light20),
          ),
          TextSpan(
            text: Utils.i18n(context, "login.signUp"),
            style: theme.font.body1.copyWith(
                color: theme.color.violet100,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => controller.unfocus(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 56),
          color: Colors.transparent,
          child: Column(
            children: [
              email,
              const SizedBox(height: 24),
              password,
              const SizedBox(height: 40),
              loginButton,
              const SizedBox(height: 32),
              forgetPassword,
              const SizedBox(height: 40),
              signUp,
            ],
          ),
        ),
      ),
    );
  }
}
