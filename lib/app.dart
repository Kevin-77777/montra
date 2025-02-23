import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:montra/states/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appState.router,
      theme: ThemeData(useMaterial3: true),
      localizationsDelegates: [
        appState.i18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: ((context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: child!,
        );
      }),
    );
  }
}
