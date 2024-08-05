
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class IndicatedTotalPay extends StatelessWidget {

  final void Function()? onTap;
  final int total;

  const IndicatedTotalPay({
    super.key,
    this.onTap,
    required this.total,
  });

  String formatNumber(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

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