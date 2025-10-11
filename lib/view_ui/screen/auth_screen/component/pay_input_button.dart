import 'package:intl/intl.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';



class PayInputButton extends StatefulWidget {

  final Function(int) onSelected;

  const PayInputButton({super.key, required this.onSelected});

  @override
  State<PayInputButton> createState() => _PayInputButtonState();
}

class _PayInputButtonState extends State<PayInputButton> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final amounts = List.generate(
      12,
          (index) => 135000 + (index * 5000),
    );


    return PopupMenuButton<int>(
      initialValue: 150000,
      onSelected: widget.onSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) {
        return amounts.map((amount) {
          return PopupMenuItem<int>(
            value: amount,
            child: Text(
              '${NumberFormat('#,###').format(amount)}원',
              style: TextStyle(
                fontSize: width > 450 ? 14 : 12,
                fontWeight: amount == 150000
                    ? FontWeight.w900
                    : FontWeight.w600,
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        height: height > 750 ? (width > 400 ? 27 : 25) : 24,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade800,
            width: 1.25,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          '일당 선택하기',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            height: textHeight,
            fontSize: height > 750 ? (width > 400 ? 15 : (width < 370 ? 13 : 14)) : 12.5,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ),
      ),


    );
  }
}
