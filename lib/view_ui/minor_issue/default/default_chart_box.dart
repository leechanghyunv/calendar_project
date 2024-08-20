import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBox extends StatelessWidget {

  final Widget? child;

  const CartBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.r, 8.r, 8.r, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.aspectRatio > 0.5
            ? MediaQuery.of(context).size.height * 0.29
            : MediaQuery.of(context).size.height * 0.26,
        color: Colors.grey[300],
        child: child,
      ),
    );
  }
}