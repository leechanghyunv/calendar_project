import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
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
          title: '일당을 입력해주세요 ',
          subtitle: '일당 버튼 탭만으로 간편하게 일당 설정하기',
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: bgColor,
          child: IconButton(
              onPressed: () => onChanged(value - 5000),
              icon: Icon(
                  Icons.remove, color: color)),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          backgroundColor: bgColor,

          child: IconButton(
            onPressed: () => onChanged(value + 5000),
            icon: Icon(
                Icons.add, color: color),
          ),
        ),
      ],
    );
  }
}
