
import '../../core/export_package.dart';

class RangeTodayCell extends ConsumerWidget {

  final DateTime day;

  const RangeTodayCell({super.key, required this.day});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          // fontSize: 20,
        ),
      ),
    );
  }
}
