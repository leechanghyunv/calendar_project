import '../../../../core/export_package.dart';
import '../const_widget.dart';

class AuthHeader extends StatelessWidget {

  final int value;
  final ValueChanged<int> onChanged;


  const AuthHeader({super.key,required this.value, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(
          title: '일당을 입력해주세요 ',
          subtitle: '일당 버튼 탭만으로 간편하게 일당 설정하기',
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
              onPressed: () => onChanged(value - 5000),
              icon: Icon(Icons.remove, color: Colors.grey.shade800)),
        ),
        SizedBox(width: 15),
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
            onPressed: () => onChanged(value + 5000),
            icon: Icon(Icons.add, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }
}
