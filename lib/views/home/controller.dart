import 'package:flutter/material.dart' as material;
import 'package:mobx/mobx.dart';
import 'package:montra/states/index.dart';

class HomeController {
  final _selectedPage = Observable(0);
  int get selectedPage => _selectedPage.value;

  bool get isHome => _selectedPage.value == 0;
  bool get isTransaction => _selectedPage.value == 1;
  bool get isBuget => _selectedPage.value == 2;
  bool get isProfile => _selectedPage.value == 3;

  void selectPage(int page) {
    if (page == selectedPage) {
      return;
    }
    Action(() => _selectedPage.value = page)();
  }

  void dispose() {
    appState.unregister<HomeController>();
    tabController.dispose();
  }

  late material.TabController _tabController;
  material.TabController get tabController => _tabController;

  final _currentTab = Observable(0);

  int get currentTab => _currentTab.value;

  bool get isToday => currentTab == 0;
  bool get isWeek => currentTab == 1;
  bool get isMonth => currentTab == 2;
  bool get isYear => currentTab == 3;

  void setTabController(material.TabController c) {
    _tabController = c;
  }

  void listenTab() {
    Action(() => _currentTab.value = tabController.index)();
  }
}
