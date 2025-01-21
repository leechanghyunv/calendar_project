import '../../../core/export_package.dart';
import '../../../theme_color.dart';

class BuildInfoRow extends StatelessWidget {
  final String taxRate;
  final String afterPay;
  final String record;
  final String recordDay;
  final String day;
  final String retire;

  const BuildInfoRow(
      {super.key,
      required this.taxRate,
      required this.afterPay,
      required this.record,
      required this.recordDay,
      required this.day,
      required this.retire});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        const SizedBox(height: 5),
        buildInfoRow(
          icon: Icons.percent,
          label: '세율',
          value: taxRate,
        ),
        buildInfoRow(
          icon: Icons.show_chart,
          label: '세후금액',
          value: afterPay,
        ),
        buildInfoRow(
          icon: Icons.construction,
          label: '건설근로공수',
          value: record,
        ),
        buildInfoRow(
          icon: Icons.local_post_office_outlined,
          label: '근로신고일수',
          value: recordDay,
        ),
        buildInfoRow(
          icon: Icons.calendar_today,
          label: '총 출력일수',
          value: day,
        ),
        buildInfoRow(
          icon: Icons.account_circle_outlined,
          label: '퇴직공제금액',
          value: retire,
        ),
      ],
    );
  }
}

final labelStyle = TextStyle(
  height: textHeight,
  fontWeight: FontWeight.w900,
  fontSize: 12,
  color: Colors.grey.shade700,
);

Widget buildInfoRow({
  required IconData icon,
  required String label,
  required String value,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        const SizedBox(width: 5),
        Text(label, style: labelStyle),
        const Spacer(),
        Text(value, style: labelStyle),
      ],
    ),
  );
}
