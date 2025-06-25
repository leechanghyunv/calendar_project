
import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class AuthButton extends StatelessWidget {

  final VoidCallback? onPressed;

  const AuthButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Expanded(
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
            child: TextWidget('모두 입력했습니다!', 15,width

            ),
          ),
        ),
      ],
    );
  }
}
