import 'package:flutter/material.dart';
import 'package:montra/app.dart';
import 'package:montra/states/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appState.init();
  runApp(const MyApp());
}
