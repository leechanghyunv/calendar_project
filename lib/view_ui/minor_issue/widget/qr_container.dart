import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/text_widget.dart';

class QrContainer extends StatelessWidget {

  final String msg;

  const QrContainer({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 85.sp,
            width: 85.sp,
            child: QrImageView(
                data: 'custom dialog'),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(DateFormat('y년 M월 dd일').
              format(DateTime.now()),15),
              TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  return TextWidget(
                      formatDate(DateTime.now(),
                          [am,' ', H, '시 ', nn, '분 ', ss, '초']),15
                  );
                },
              ),
              TextWidget(msg,15),
            ],
          ),

        ],
      ),
    );
  }
}
