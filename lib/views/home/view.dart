import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra/states/index.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/home/controller.dart';
import 'package:montra/views/home/widgets/home.dart';

class Home extends StatefulWidget {
  static String path = "/home";
  static String name = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController get controller => appState.get<HomeController>();

  @override
  void initState() {
    super.initState();

    appState.register(HomeController());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late List<Widget> icons = [home, transaction, buget, profile];

  Widget getIcon({
    required String path,
    required bool selected,
    required String label,
  }) {
    return Column(
      children: [
        const SizedBox(height: 4),
        SvgPicture.asset(
          path,
          width: 32,
          height: 32,
          colorFilter: ColorFilter.mode(
            selected ? theme.color.violet100 : const Color(0xFFC6C6C6),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.font.tiny.copyWith(
            fontSize: 10,
            color: selected ? theme.color.violet100 : const Color(0xFFC6C6C6),
          ),
        ),
      ],
    );
  }

  Widget get home => Observer(
        builder: (_) => getIcon(
          path: "assets/images/home.svg",
          selected: controller.isHome,
          label: Utils.i18n(context, "home"),
        ),
      );
  Widget get transaction => Observer(
        builder: (_) => getIcon(
          path: "assets/images/transaction.svg",
          selected: controller.isTransaction,
          label: Utils.i18n(context, "transaction"),
        ),
      );
  Widget get buget => Observer(
        builder: (_) => getIcon(
          path: "assets/images/pie-chart.svg",
          selected: controller.isBuget,
          label: Utils.i18n(context, "buget"),
        ),
      );
  Widget get profile => Observer(
        builder: (_) => getIcon(
          path: "assets/images/user.svg",
          selected: controller.isProfile,
          label: Utils.i18n(context, "profile"),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        children: const [
          HomeView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: theme.color.violet100,
        onPressed: () {},
        child: Icon(
          Icons.add_outlined,
          size: 40,
          color: theme.color.light80,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: theme.color.light80,
        itemCount: icons.length,
        tabBuilder: (index, isActive) => icons[index],
        activeIndex: controller.selectedPage,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => controller.selectPage(index),
      ),
    );
  }
}
