import 'dart:async';
import 'package:mobx/mobx.dart' as mobx;
import 'package:flutter/material.dart';
import 'package:montra/states/index.dart';

class LoginController {
  PageController pageController = PageController();
  PageController guidePageController = PageController();
  TextEditingController passwordController = TextEditingController();

  Timer? _timer;

  void dispose() {
    _timer?.cancel();
    appState.unregister<LoginController>();
  }

  final _obscurePassword = mobx.Observable(true);
  bool get obscurePassword => _obscurePassword.value;

  late var showPassword = mobx.Action(() {
    _obscurePassword.value = !_obscurePassword.value;
  });

  void pushToLoginPage() {
    _timer?.cancel();
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void autoPlayGuide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (guidePageController.page == 2) {
        guidePageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        return;
      }

      guidePageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  void pushToGuidePage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    autoPlayGuide();
  }

  void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
