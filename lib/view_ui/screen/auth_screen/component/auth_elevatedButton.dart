import '../../../../core/export_package.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/left_eleveted_button.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onPressedReset;
  final VoidCallback? onPressed;
  final String? text;

  const AuthButton({super.key, this.onPressedReset, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: LeftElevatedButton(
            text: '초기화',
            onPressed: () => onPressedReset?.call(),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: CustomElevatedButton(
            text: '모두 입력했습니다!',
            onPressed: () => onPressed?.call(),
          ),
        ),
      ],
    );
  }
}
