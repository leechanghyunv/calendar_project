
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {

  final List<Widget> children;

  const DefaultScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

class DefaultIntroScreen extends StatelessWidget {

  final List<Widget> children;

  const DefaultIntroScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),

    );
  }
}