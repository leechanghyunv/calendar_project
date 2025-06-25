import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme_color.dart';

class DefaultScreen extends StatelessWidget {
  final Widget body;
  final List<Widget> buttom;

  const DefaultScreen(
      {super.key,
        required this.body,
        required this.buttom,
      });

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final double isSmall = Platform.isAndroid ? appHeight * 0.0125 : appHeight * 0.0225;
    final double isBig = Platform.isAndroid ? appHeight * 0.008 : appHeight * 0.028;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeColor,
      body: Center(
        child: body,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.translate(
        offset: Offset(0, appWidth < 380 ? isSmall : isBig),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: buttom,
        ),
      ),
    );
  }
}

