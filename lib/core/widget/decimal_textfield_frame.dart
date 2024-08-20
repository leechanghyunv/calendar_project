

import 'package:flutter/material.dart';

Widget frameBox(Widget row, Widget textField) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: 100,
    color: Colors.grey.shade100,
    child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          row,
          textField,
          const SizedBox(height: 10),
        ],
      ),
    ),
  ),
);