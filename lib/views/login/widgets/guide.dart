import 'package:flutter/widgets.dart';
import 'package:montra/components/button/primary.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/states/index.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/login/controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  LoginController get controller => appState.get<LoginController>();
  Size get screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.autoPlayGuide();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getScrollItem({
    required String img,
    required String title,
    required String desc,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img),
        const SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.font.title1.copyWith(color: theme.color.dark50),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: theme.font.body1.copyWith(color: theme.color.light20),
        ),
      ],
    );
  }

  Widget get money1 {
    return getScrollItem(
      img: "assets/images/money.png",
      title: Utils.i18n(context, "login.controllMoney"),
      desc: Utils.i18n(context, "login.moneyManager"),
    );
  }

  Widget get money2 {
    return getScrollItem(
      img: "assets/images/money2.png",
      title: Utils.i18n(context, "login.knowMoney"),
      desc: Utils.i18n(context, "login.trackTransaction"),
    );
  }

  Widget get planning {
    return getScrollItem(
      img: "assets/images/planning.png",
      title: Utils.i18n(context, "login.planning"),
      desc: Utils.i18n(context, "login.setupBuget"),
    );
  }

  Widget get scrollView {
    return SizedBox(
      height: 508,
      child: PageView(
        controller: controller.guidePageController,
        children: [
          money1,
          money2,
          planning,
        ],
      ),
    );
  }

  Widget get indicator {
    return SmoothPageIndicator(
      controller: controller.guidePageController,
      count: 3,
      effect: ScrollingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        dotColor: theme.color.violet20,
        activeDotColor: theme.color.violet100,
      ),
    );
  }

  Widget get signUp {
    return MontraButton.primary(
      text: Utils.i18n(context, "login.signUp"),
    );
  }

  Widget get login {
    return MontraButton.secondary(
      text: Utils.i18n(context, "login.login"),
      onPressed: controller.pushToLoginPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      padding: const EdgeInsets.only(
        top: 76,
        left: 32,
        right: 32,
        bottom: 44,
      ),
      child: Column(
        children: [
          scrollView,
          const SizedBox(height: 32),
          indicator,
          const SizedBox(height: 52),
          signUp,
          const SizedBox(height: 16),
          login,
        ],
      ),
    );
  }
}
