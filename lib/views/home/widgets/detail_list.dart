import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra/states/index.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/home/controller.dart';
import 'package:montra/views/home/widgets/transaction_item.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList>
    with SingleTickerProviderStateMixin {
  HomeController get controller => appState.get<HomeController>();

  @override
  void initState() {
    super.initState();

    controller.setTabController(TabController(length: 4, vsync: this));
    controller.tabController.addListener(controller.listenTab);
  }

  Widget get tab {
    return TabBar(
      controller: controller.tabController,
      indicator: BoxDecoration(
        color: theme.color.yellow20,
        borderRadius: BorderRadius.circular(20),
      ),
      labelStyle: const TextStyle(color: Colors.white),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      indicatorAnimation: TabIndicatorAnimation.elastic,
      tabs: [
        Tab(
          child: Observer(builder: (BuildContext c) {
            return Text(
              Utils.i18n(context, "home.today"),
              style: theme.font.body2.copyWith(
                color: controller.isToday
                    ? theme.color.yellow100
                    : theme.color.light20,
              ),
            );
          }),
        ),
        Tab(
          child: Observer(builder: (BuildContext c) {
            return Text(
              Utils.i18n(context, "home.week"),
              style: theme.font.body2.copyWith(
                color: controller.isWeek
                    ? theme.color.yellow100
                    : theme.color.light20,
              ),
            );
          }),
        ),
        Tab(
          child: Observer(builder: (BuildContext c) {
            return Text(
              Utils.i18n(context, "home.month"),
              style: theme.font.body2.copyWith(
                color: controller.isMonth
                    ? theme.color.yellow100
                    : theme.color.light20,
              ),
            );
          }),
        ),
        Tab(
          child: Observer(builder: (BuildContext c) {
            return Text(
              Utils.i18n(context, "home.year"),
              style: theme.font.body2.copyWith(
                color: controller.isYear
                    ? theme.color.yellow100
                    : theme.color.light20,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget get listTitle {
    return Row(
      children: [
        Text(
          Utils.i18n(context, "home.recentTransaction"),
          style: theme.font.title3.copyWith(
            color: theme.color.dark25,
          ),
        ),
        const Spacer(),
        Container(
          width: 78,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: theme.color.violet20,
          ),
          child: Text(
            Utils.i18n(context, "home.seeAll"),
            style: theme.font.body3.copyWith(
              color: theme.color.violet100,
            ),
          ),
        ),
      ],
    );
  }

  Widget get transactionList {
    return SingleChildScrollView(
      child: TransactionItem(
        icon: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: theme.color.yellow20,
          ),
          width: 60,
          height: 60,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/images/shopping.svg",
            width: 40,
            height: 40,
          ),
        ),
        title: Utils.i18n(context, "home.shopping"),
        detail: "Buy some grocery",
        time: DateTime.now(),
        cost: 120,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          tab,
          const SizedBox(height: 8),
          listTitle,
          const SizedBox(height: 8),
          transactionList,
        ],
      ),
    );
  }
}
