

import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          // child: Text('  HELLO',
          //   style: TextStyle(fontSize: 20.5.sp,
          //       fontWeight: FontWeight.w900,letterSpacing: 3.5),
          // ),
        ),
      ),
    );
  }
}
