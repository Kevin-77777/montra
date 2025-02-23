import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MontraFont {
  final TextStyle titleX;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;

  final TextStyle regular1;
  final TextStyle regular2;
  final TextStyle regular3;

  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;

  final TextStyle small;

  final TextStyle tiny;

  const MontraFont({
    required this.titleX,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.regular1,
    required this.regular2,
    required this.regular3,
    required this.small,
    required this.tiny,
  });
}

class ClassicFont implements MontraFont {
  @override
  final TextStyle titleX = GoogleFonts.inter(
    fontSize: 64.0,
    fontWeight: FontWeight.bold,
    height: 1.25,
  );

  @override
  final TextStyle title1 = GoogleFonts.inter(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    height: 1.06,
  );

  @override
  final TextStyle title2 = GoogleFonts.inter(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 0.91,
  );

  @override
  final TextStyle title3 = GoogleFonts.inter(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.22,
  );

  @override
  final TextStyle body1 = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  @override
  final TextStyle body2 = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.28,
  );

  @override
  final TextStyle body3 = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  @override
  final TextStyle regular1 = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.19,
  );

  @override
  final TextStyle regular2 = GoogleFonts.inter(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.19,
  );

  @override
  final TextStyle regular3 = GoogleFonts.inter(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.29,
  );

  @override
  final TextStyle small = GoogleFonts.inter(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    height: 1.23,
  );

  @override
  final TextStyle tiny = GoogleFonts.inter(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1,
  );
}
