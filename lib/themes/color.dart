import 'package:flutter/material.dart';

abstract class MontraColor {
  final Color dark25;
  final Color dark50;
  final Color dark75;
  final Color dark100;

  final Color light20;
  final Color light40;
  final Color light60;
  final Color light80;
  final Color light100;

  final Color violet20;
  final Color violet40;
  final Color violet60;
  final Color violet80;
  final Color violet100;

  final Color red20;
  final Color red40;
  final Color red60;
  final Color red80;
  final Color red100;

  final Color green20;
  final Color green40;
  final Color green60;
  final Color green80;
  final Color green100;

  final Color yellow20;
  final Color yellow40;
  final Color yellow60;
  final Color yellow80;
  final Color yellow100;

  final Color blue20;
  final Color blue40;
  final Color blue60;
  final Color blue80;
  final Color blue100;

  const MontraColor({
    required this.dark25,
    required this.dark50,
    required this.dark75,
    required this.dark100,
    required this.light20,
    required this.light40,
    required this.light60,
    required this.light80,
    required this.light100,
    required this.violet20,
    required this.violet40,
    required this.violet60,
    required this.violet80,
    required this.violet100,
    required this.red20,
    required this.red40,
    required this.red60,
    required this.red80,
    required this.red100,
    required this.green20,
    required this.green40,
    required this.green60,
    required this.green80,
    required this.green100,
    required this.yellow20,
    required this.yellow40,
    required this.yellow60,
    required this.yellow80,
    required this.yellow100,
    required this.blue20,
    required this.blue40,
    required this.blue60,
    required this.blue80,
    required this.blue100,
  });
}

class ClassicColor implements MontraColor {
  @override
  final Color dark25 = const Color(0xFF7A7E80);
  @override
  final Color dark50 = const Color(0xFF464A4D);
  @override
  final Color dark75 = const Color(0xFF000000);
  @override
  final Color dark100 = const Color(0xFF0D0E0F);

  @override
  final Color light20 = const Color(0xFF91919F);
  @override
  final Color light40 = const Color(0xFFF2F4F5);
  @override
  final Color light60 = const Color(0xFFF7F9FA);
  @override
  final Color light80 = const Color(0xFFFCFCFC);
  @override
  final Color light100 = const Color(0xFFFFFFFF);

  @override
  final Color violet20 = const Color(0xFFEEE5FF);
  @override
  final Color violet40 = const Color(0xFFD3BDFF);
  @override
  final Color violet60 = const Color(0xFFB18AFF);
  @override
  final Color violet80 = const Color(0xFF8F57FF);
  @override
  final Color violet100 = const Color(0xFF7F3DFF);

  @override
  final Color red20 = const Color(0xFFFDD5D7);
  @override
  final Color red40 = const Color(0xFFFDA2A9);
  @override
  final Color red60 = const Color(0xFFFD6F7A);
  @override
  final Color red80 = const Color(0xFFFD5662);
  @override
  final Color red100 = const Color(0xFFFD3C4A);

  @override
  final Color green20 = const Color(0xFFCFFAEA);
  @override
  final Color green40 = const Color(0xFF93EACA);
  @override
  final Color green60 = const Color(0xFF65D1AA);
  @override
  final Color green80 = const Color(0xFF2AB784);
  @override
  final Color green100 = const Color(0xFF00A86B);

  @override
  final Color yellow20 = const Color(0xFFFCEED4);
  @override
  final Color yellow40 = const Color(0xFFFCDDA1);
  @override
  final Color yellow60 = const Color(0xFFFCCC6F);
  @override
  final Color yellow80 = const Color(0xFFFCBB3C);
  @override
  final Color yellow100 = const Color(0xFFFCAC12);

  @override
  final Color blue20 = const Color(0xFFBDDCFF);
  @override
  final Color blue40 = const Color(0xFF8AC0FF);
  @override
  final Color blue60 = const Color(0xFF57A5FF);
  @override
  final Color blue80 = const Color(0xFF248AFF);
  @override
  final Color blue100 = const Color(0xFF0077FF);
}
