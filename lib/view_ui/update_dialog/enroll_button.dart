import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/converter.dart';
import '../../core/widget/text_widget.dart';

class EnrollButton extends StatefulWidget {

  final String iconUi;
  final String title;
  final String subtitle;

  final void Function()? onTap;

  const EnrollButton({super.key, this.onTap, required this.iconUi, required this.title, required this.subtitle});

  @override
  State<EnrollButton> createState() => _EnrollButtonState();
}

class _EnrollButtonState extends State<EnrollButton> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                width: 100.w,
                height: 50.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(widget.iconUi,15.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextWidget(widget.title,15.sp),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextWidget('${numberWithCommas(widget.subtitle)}원',15.sp),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}