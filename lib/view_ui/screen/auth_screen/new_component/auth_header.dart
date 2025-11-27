import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../const_widget.dart';

class AuthHeader extends StatelessWidget {

  final int value;
  final ValueChanged<int> onChanged;


  const AuthHeader({super.key,required this.value, required this.onChanged,});

  @override
  Widget build(BuildContext context) {

    final color = context.isDark ? Colors.white : Colors.grey.shade800;
    final bgColor = context.isDark ? Colors.black87 : Colors.grey.shade200;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(
          title: '일당을 입력해주세요',
          subtitle: '일당을 입력하면 자동으로 일당을 수정합니다',
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: bgColor,
          child: IconButton(
              onPressed: () {
                final val = value - 5000;
                customMsg(formatAmount(val));
                onChanged(val);
              },
              icon: Icon(
                  Icons.remove, color: color)),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          backgroundColor: bgColor,

          child: IconButton(
            onPressed: () {
              final val = value + 5000;
              customMsg(formatAmount(val));
              onChanged(val);
            },
            icon: Icon(
                Icons.add, color: color),
          ),
        ),
      ],
    );
  }
}
