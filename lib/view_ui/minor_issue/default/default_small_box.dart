import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultSmallBox extends StatelessWidget {

  final Widget? child;

  const DefaultSmallBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      color: Colors.grey[300],
      width: 180.w,
      height: 70.w,
      child: child,
    );
  }
}
