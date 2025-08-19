import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// MediaQuery.of(context).size.width
  double get width => MediaQuery.of(this).size.width;

  /// MediaQuery.of(context).size.height
  double get height => MediaQuery.of(this).size.height;
}