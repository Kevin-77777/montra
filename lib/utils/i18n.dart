import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class I18n {
  final FlutterI18nDelegate delegate;

  I18n({required this.delegate});

  factory I18n.init() {
    final FlutterI18nDelegate i18n = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
        basePath: 'assets/i18n',
      ),
    );

    return I18n(delegate: i18n);
  }

  String translate(
    BuildContext context, {
    required String key,
    Map<String, String>? format,
  }) {
    var text = FlutterI18n.translate(context, key);

    format?.forEach((k, v) {
      text = text.replaceAll(k, v);
    });

    return text;
  }
}
