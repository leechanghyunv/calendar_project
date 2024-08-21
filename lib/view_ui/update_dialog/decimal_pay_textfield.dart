import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'decimal_dialog.dart';


class DecimalPayTextfield extends ConsumerStatefulWidget {

  const DecimalPayTextfield({super.key});

  @override
  ConsumerState<DecimalPayTextfield> createState() => _DecimalPayTextfieldState();
}

class _DecimalPayTextfieldState extends ConsumerState<DecimalPayTextfield> {

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => DecimalDialog(),
              );
            },
            child: DecimalTextButton(),
          ),
        ));
  }
}



Widget DecimalTextButton() => Container(
  width: 100.w,
  height: 40.w,
  alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            '근무 유형 직접 입력하기',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ],
      ),
      SizedBox(height: 5.h),
      Row(
        children: [
          TextWidget2('휴무 포함, 등록되지 않는 근무유형 등록',8.sp, Colors.purple.shade900),
        ],
      ),
    ],
  ),
);


