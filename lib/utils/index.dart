import 'package:flutter/material.dart';
import 'package:montra/states/index.dart';

class Utils {
  static String i18n(BuildContext context, String path,
          {Map<String, String>? format}) =>
      appState.i18n.translate(context, key: path, format: format);
}
