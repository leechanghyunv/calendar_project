
import 'package:calendar_project_240727/core/export_package.dart';
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

    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;


    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(formatNumber(total).isEmpty
              ? '누적금액(세후): 0원'
              : '누적금액(세후): ${formatNumber(total)}원',
            style: TextStyle(
              fontSize: screenUtilSize(15),
              fontWeight: FontWeight.bold,
            ),),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.settings,
              color: Colors.grey[600],size: adaptiveSize(20),),
          ),
        ],
      ),
    );
  }
}