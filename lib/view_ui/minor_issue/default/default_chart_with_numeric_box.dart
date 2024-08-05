import 'package:flutter/cupertino.dart';

class PieChartNumericTextBox extends StatelessWidget {

  final List<Widget> children;

  const PieChartNumericTextBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.0, 14.0, 7.0, 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
