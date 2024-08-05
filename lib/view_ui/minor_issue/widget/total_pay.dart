import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/converter.dart';

class TotalPay extends StatelessWidget {

  final void Function()? onTap;
  final int total;

  const TotalPay({super.key, this.onTap, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(formatNumber(total).isEmpty
              ? '누적금액(세후): 0원'
              : '누적금액(세후): ${formatNumber(total)}원',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.settings,
              color: Colors.grey[600],size: 20,),
          ),
        ],
      ),
    );
  }
}
