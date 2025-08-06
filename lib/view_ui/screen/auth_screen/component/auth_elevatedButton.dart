
import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class AuthButton extends StatelessWidget {

  final VoidCallback? onPressedReset;
  final VoidCallback? onPressed;
  final String? text;

  const AuthButton({super.key, this.onPressedReset,this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPressedReset,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.5),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.grey,
                width: 1.25,
              ),
            ),
            child: TextWidget(text ?? '초기화', 15,width

            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.5),
              ),
              elevation: 0,
              side: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: TextWidget(text ?? '모두 입력했습니다!', 15,width

            ),
          ),
        ),
      ],
    );
  }
}
