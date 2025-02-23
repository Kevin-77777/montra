import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:montra/views/home/view.dart';
import 'package:montra/views/launch/view.dart';
import 'package:montra/views/login/view.dart';

Widget transitionsBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  final tween = Tween(begin: 0.8, end: 1.0).animate(animation);
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(
      scale: tween,
      child: child,
    ),
  );
}

GoRouter initRouter() {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Launch.path,
        name: Launch.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CustomTransitionPage(
            transitionsBuilder: transitionsBuilder,
            child: Launch(),
          );
        },
      ),
      GoRoute(
        path: Login.path,
        name: Login.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CustomTransitionPage(
            transitionsBuilder: transitionsBuilder,
            child: Login(),
          );
        },
      ),
      GoRoute(
        path: Home.path,
        name: Home.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const CustomTransitionPage(
            transitionsBuilder: transitionsBuilder,
            child: Home(),
          );
        },
      ),
    ],
  );

  return router;
}
