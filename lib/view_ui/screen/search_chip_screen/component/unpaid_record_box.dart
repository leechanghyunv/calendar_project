
import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/extentions/theme_extension.dart';

class UnpaidRecordBox extends HookConsumerWidget {
  const UnpaidRecordBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = context.width.responsiveSize([14, 13.5, 13.5, 13.5, 13, 12]);

    final historyList = useState([
      (isSettled: true, date: '01', wage: 255000),
      (isSettled: false, date: '02', wage: 180000),
      (isSettled: false, date: '05', wage: 320000),
      (isSettled: true, date: '10', wage: 200000),
      (isSettled: false, date: '15', wage: 152000),
      (isSettled: false, date: '17', wage: 152000),
    ]);

    return Column(
      children: [
        const SizedBox(height: 10),
        _TitleRow(fontSize: fontSize),
        const SizedBox(height: 4),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: historyList.value.length,
          itemBuilder: (_, i) {
            final data = historyList.value[i];
            return _DataRow(
              isSettled: data.isSettled,
              date: data.date,
              wage: data.wage,

              fontSize: fontSize,
              onToggle: () {
                final updated = [...historyList.value];
                updated[i] = (
                isSettled: !data.isSettled,
                date: data.date,
                wage: data.wage,

                );
                historyList.value = updated;
              },
            );
          },
        ),
      ],
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.5),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text('날짜', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            child: Text('정산금액(만원)', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            width: 50,
            child: Text('정산여부', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.isSettled,
    required this.date,
    required this.wage,
    required this.fontSize,
    required this.onToggle,
  });

  final bool isSettled;
  final String date;
  final int wage;
  final double fontSize;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [

          SizedBox(
            width: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                date,
                style: TextStyle(fontSize: fontSize, color: context.textColor),
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${(wage / 10000).toStringAsFixed(1)}',
              style: TextStyle(fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: context.subTextColor),
            ),
          ),
          SizedBox(
            width: 30,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onToggle();
              },
              child: Icon(
                isSettled ? Icons.check_box : Icons.check_box_outline_blank,
                size: fontSize + 5,
                color: isSettled
                    ? Colors.teal
                    : (context.isDark ? Colors.white54 : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}