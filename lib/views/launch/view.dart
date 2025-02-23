import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra/themes/theme.dart';
import 'package:montra/states/index.dart';
import 'package:montra/utils/index.dart';
import 'package:montra/views/home/view.dart';

class Launch extends StatefulWidget {
  static String path = "/";
  static String name = "launch";

  const Launch({super.key});

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  late Size screenSize = MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        appState.router.replaceNamed(Home.name);
      });
    });
  }

  Widget get montra {
    return Text(
      Utils.i18n(context, "launch.montra"),
      style: GoogleFonts.inter(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: theme.color.light100,
      ),
    );
  }

  Widget get circle {
    return Positioned(
      width: 74,
      height: 74,
      left: screenSize.width / 2 - 68,
      child: Container(
        width: 74,
        height: 74,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: theme.color.yellow100,
          backgroundBlendMode: BlendMode.overlay,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.color.violet100,
      width: screenSize.width,
      height: screenSize.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          circle,
          montra,
        ],
      ),
    );
  }
}
