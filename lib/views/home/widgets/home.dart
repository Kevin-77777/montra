import 'package:flutter/material.dart';
import 'package:montra/states/index.dart';
import 'package:montra/views/home/controller.dart';
import 'package:montra/views/home/widgets/chart_card.dart';
import 'package:montra/views/home/widgets/detail_list.dart';
import 'package:montra/views/home/widgets/title_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController get controller => appState.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleCard(),
        ChatCard(),
        DetailList(),
      ],
    );
  }
}
