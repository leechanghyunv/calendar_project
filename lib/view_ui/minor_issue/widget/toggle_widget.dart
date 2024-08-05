
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleWidget extends StatefulWidget {

  final void Function(int?)? onToggle;

  const ToggleWidget({super.key, this.onToggle});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 80.0.w,
      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey.shade400,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      radiusStyle: true,
      customTextStyles: [
        TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black),
        TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black)],
      labels: ['근로조건', '근무등록'],
      activeBgColors: [[Colors.blue.shade500],[Colors.blue.shade500]],
      onToggle: widget.onToggle,
    );
  }
}
